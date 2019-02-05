class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  PER = 8

  def index
     @tasks = Task.sort_create.page(params[:page]).per(PER)
    
    #終了期限でソート
    @tasks = Task.all.sort_deadline.page(params[:page]).per(PER) if params[:sort_expired]

    #優先順位でソート
    @tasks = Task.all.sort_priority.page(params[:page]).per(PER) if params[:sort_priority]

    #タイトルとステータスで検索
    if params[:title] && params[:status]
      @tasks = Task.search_with_title(params[:title]).search_with_status(params[:status]).page(params[:page]).per(PER)
    #タイトルで検索
    elsif params[:title]
      @tasks = search_with_title(params[:title]).page(params[:page]).per(PER)
    #ステータスで検索
    elsif params[:status]
      @tasks = search_with_status(params[:status]).page(params[:page]).per(PER)
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "登録が完了しました"
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
      redirect_to tasks_path, notice: "編集が完了しました"
    else
      render "edit"
    end
  end
  
  def destroy
    @task.destroy
    redirect_to tasks_path, notice: "タスクを削除しました"
  end
  
  private

  def set_task
     @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:title, :content, :deadline, :status, :priority)
  end

end
