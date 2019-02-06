class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user

  PER = 8

  def index
    #ソート
    @tasks = Task.sort_create #作成順
    @tasks = Task.all.sort_deadline if params[:sort_expired] #終了期限
    @tasks = Task.all.sort_priority if params[:sort_priority]#優先順位

    #検索
    if params[:title] && params[:status]
      @tasks = Task.search_with_title(params[:title]).search_with_status(params[:status])#タイトルとステータスで検索
    elsif params[:title]
      @tasks = search_with_title(params[:title])#タイトルで検索
    elsif params[:status]
      @tasks = search_with_status(params[:status])#ステータスで検索
    end

    @tasks = @tasks.page(params[:page]).per(PER)#ページネーション追加
  end

  def new
    @task = Task.new
    
  end

  def create
    @task = current_user.tasks.build(task_params)  #ログイン中のユーザーのidを渡す
    if @task.save
      redirect_to tasks_path, notice: "タスク「#{@task.title}」を登録しました"
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "タスク「#{@task.title}」を編集しました"
    else
      render "edit"
    end
  end
  
  def destroy
    @task.destroy
    redirect_to tasks_path, notice: "タスク「#{@task.title}」を削除しました"
  end
  
  private

  def set_task
     @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:title, :content, :deadline, :status, :priority)
  end

end
