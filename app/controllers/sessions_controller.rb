class SessionsController < ApplicationController
  before_action :authenticate_user, only: [:destroy]
  before_action :forbid_login_user, only: [:new, :create]

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to tasks_path, notice: "ログインしました"
    else
      flash[:danger] = 'ログインに失敗しました'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_session_path, notice: "ログアウトしました"
  end
end
