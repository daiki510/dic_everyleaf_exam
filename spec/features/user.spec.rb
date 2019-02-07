require 'rails_helper'

RSpec.feature "ユーザー管理機能", type: :feature do

  #テストで使用するデータを共通化
  # background do
  #   FactoryBot.create(:user)
  #   # FactoryBot.create(:task, title: '付け加えた名前１')
  # end

  #ユーザー登録のテスト
  scenario "ユーザー登録画面で、必要項目を入力してcreateボタンを押したらデータが保存され,ユーザー詳細画面が表示される" do
    visit new_user_path
    
    
    fill_in "Name",	with: "test_user" 
    fill_in "Email",	with: "test_user@gmail.com" 
    fill_in "Password",	with: "000000" 
    fill_in "Password confirmation",	with: "000000" 
    
    click_on '登録する'
    
    
    expect(page).to  have_content 'test_user'
    expect(page).to  have_content 'test_user@gmail.com'

  end

  #ユーザー詳細画面の確認テスト
  scenario "ユーザー名をクリックするとユーザー詳細画面が見れるかどうかのテスト" do
   
  end

  #ログイン確認テスト
  scenario "ログインした後に、ヘッダーにログイン者の名前があるかどうかのテスト" do
    visit new_session_path
    
    fill_in "Email",	with: "test01@gmail.com" 
    fill_in "Password",	with: "test01"
    
    click_on 'Log in'
    
    save_and_open_page
    expect(page).to have_content "test01"
  end
  
  #ログアウト確認テスト
  scenario "ログアウトした後にログイン画面が出てくるかどうか" do
   
  end
  
  

end

