class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    if params[:sort_expired]
      @tasks = Task.all.sort_deadline
    elsif params[:sort_priority]
      @tasks = Task.all.sort_priority
    elsif params[:title] && params[:status]
      @tasks = Task.search_with_title(params[:title]).search_with_status(params[:status])
    elsif params[:title]
      @tasks = search_with_title(params[:title])
    elsif params[:status]
      @tasks = search_with_status(params[:status])
    else
      @tasks = Task.all.sort_create
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
