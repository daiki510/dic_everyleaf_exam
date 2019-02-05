module SessionsHelper
  #現在ログインしているユーザーを取得
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def authenticate_user
    if current_user == nil
      redirect_to new_session_path, notice: "ログインが必要です"
    end
  end

  def forbid_login_user
    if current_user
      redirect_to tasks_path, notice: "ログイン済です"
    end
  end

  def enssure_correct_user
    if current_user.id != params[:id].to_i
      redirect_to user_path(current_user.id), notice: "権限がありません"
    end
  end
end