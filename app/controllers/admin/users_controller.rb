class Admin::UsersController < ApplicationController
  before_action :require_admin

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # session[:user_id] = @user.id
      redirect_to admin_users_path(@user.id), notice: "ユーザー登録が完了しました"
    else
      render "new"
    end
  end

  def index

  end

  
  def show
    
  end

  def edit
  end

  def update

  end

  def destroy

  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation, :admin)
  end

  #管理者のみユーザー管理画面へアクセスできるように制御
  def require_admin
    unless current_user.admin? 
     redirect_to root_path , notice: "権限がありません"
    end
  end
end
