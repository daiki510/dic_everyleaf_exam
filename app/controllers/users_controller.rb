# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authenticate_user, only: [:show]
  before_action :forbid_login_user, only: %i[new create]
  before_action :enssure_correct_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id), notice: 'ユーザー登録が完了しました'
    else
      render 'new'
    end
  end

  def show; end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
