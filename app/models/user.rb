class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 30}
  validates :email, presence: true, length: {maximum: 100},format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },uniqueness: true
  validates :password, presence: true, length: {minimum: 6}, on: :create

  #メールアドレスを全て小文字へ変換
  before_validation { email.downcase! }

  #パスワードをハッシュ化
  has_secure_password
end
