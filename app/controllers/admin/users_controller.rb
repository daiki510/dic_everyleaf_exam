class Admin::UsersController < ApplicationController
  before_action :require_admin

  def new
  end

  def edit
  end

  def show
  end

  def index
  end

  private

  def require_admin
    unless current_user.admin? 
     redirect_to root_path , notice: "権限がありません"
    end
  end
end
