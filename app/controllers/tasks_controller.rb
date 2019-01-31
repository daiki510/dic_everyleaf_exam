class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all.order(updated_at: :desc)
  end
  
  def new
    @task = Task.new
  end

  def create
    # binding.pry
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
    params.require(:task).permit(:title, :content)
  end

end
