class TasksController < ApplicationController
  before_action :enssure_correct_user_for_task, only: [:show, :edit, :update, :destroy]
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user
 

  PER = 8

  def index
    #ログインしているユーザーのみTaskデータを取り出す
    @tasks = current_user.tasks.sort_create #作成順
    
    #検索
    if params[:title] && params[:status]
      @tasks = current_user.tasks.search_with_title(params[:title]).search_with_status(params[:status])#タイトルとステータスで検索
    elsif params[:title]
      @tasks = search_with_title(params[:title])#タイトルで検索
    elsif params[:status]
      @tasks = search_with_status(params[:status])#ステータスで検索
    elsif params[:label_id]
      @tasks = Task.search_with_label(params[:label_id])#ラベルで検索
    end

    #ソート
    @tasks = current_user.tasks.sort_priority if params[:sort_priority] == "true"#優先順位
    @tasks = current_user.tasks.sort_deadline if params[:sort_expired] == "true" #終了期限
    
    #ページネーション追加
    @tasks = @tasks.page(params[:page]).per(PER)
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
     @task = current_user.tasks.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:title, :content, :deadline, :status, :priority, :label_name, label_ids: [])
  end

  #ログインしているユーザーのみタスク管理できる
  def enssure_correct_user_for_task
    @task = Task.find(params[:id])
    if current_user.id != @task.user_id
      redirect_to tasks_path, notice: "権限がありません"
    end
  end

end
