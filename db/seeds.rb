# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ユーザーデータの作成
(1..10).each do |i|
  @admin_user_i = User.create(
    name:    "admin_user_#{i}",
    email: "admin_user_#{i}@sample.com",
    password:  "000000",
    password_confirmation:  "000000",
    admin: true
    )
  end
  # タスクデータの作成
  (1..10).each do |i|
    Task.create(
      title:    "user#{i}のタスク1",
      content: "user#{i}のタスク1の内容",
      user_id: @admin_user_i.id
    )
    Task.create(
      title:    "user#{i}のタスク2",
      content: "user#{i}のタスク2の内容",
      user_id: @admin_user_i.id
    )
  end
      
  # # ユーザーデータの作成
  # (1..100).each do |i|
  #   @user_i = User.create(
  #     name:    "user_#{i}",
  #     email: "user-#{i}@sample.com",
  #     password:  "000000",
  #     password_confirmation:  "000000"
  #   )
  # end
  
  # # タスクデータの作成
  # (1..100).each do |i|
  #   Task.create(
  #     title:    "user#{i}のタスク1",
  #     content: "user#{i}のタスク1の内容",
  #     user_id: @user_i.id
  #   )
  #   Task.create(
  #     title:    "user#{i}のタスク2",
  #     content: "user#{i}のタスク2の内容",
  #     user_id: @user_i.id
  #   )
  # end

