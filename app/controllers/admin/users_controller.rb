class Admin::UsersController < ApplicationController
  before_action :forbid_before_login
  before_action :forbid_general_user
  before_action :prohibited_admin_destroy, only: [:destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  PER = 10
  def index
    @users = User.all.order(admin: :desc).order(id: :asc).page(params[:page]).per(PER)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path(@user.id), notice: "ユーザー「#{@user.name}」を登録しました"
    else
      render "new"
    end
  end

  def show
    # raise
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "ユーザー「#{@user.name}」を更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path, notice: "ユーザー「#{@user.name}」を削除しました"
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation, :admin)
  end

  #管理者のみユーザー管理画面へアクセスできるように制御
  def forbid_general_user
    unless current_user.admin?
     redirect_to root_path , notice: "権限がありません"
    end
  end
  
  #ログイン前に管理画面へアクセスできないように制御
  def forbid_before_login
    unless current_user
      redirect_to new_session_path , notice: "権限がありません"
    end
  end

  #管理者自身が自分のアカウントを削除できないように制御
  def prohibited_admin_destroy
    if current_user.admin? && current_user === @user 
      redirect_to admin_users_path , notice: "管理者の削除はできません"
    end
  end
end
