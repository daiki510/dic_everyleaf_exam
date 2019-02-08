class ApplicationController < ActionController::Base
  #Basic認証の追加　
  http_basic_authenticate_with :name => ENV['BASIC_USERNAME'], :password => ENV['BASIC_PASSWORD'] if Rails.env == "production"

  #セッション用のヘルパーモジュールをインクルード
  include SessionsHelper
end