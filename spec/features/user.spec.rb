require 'rails_helper'

RSpec.feature "ユーザー管理機能", type: :feature do

  # テストで使用するデータを共通化
  background do
    FactoryBot.create(:user)
    # FactoryBot.create(:task, title: '付け加えた名前１')
  end

  #ユーザー登録のテスト
  scenario "ユーザー登録画面で、必要項目を入力してcreateボタンを押したらデータが保存され,ユーザー詳細画面が表示される" do
    visit new_user_path
    
    fill_in "名前",	with: "test_user" 
    fill_in "メールアドレス",	with: "test_user@gmail.com" 
    fill_in "パスワード",	with: "000000" 
    fill_in "パスワード確認用",	with: "000000" 
    
    click_button '登録する'
    
    expect(page).to  have_content 'test_user'
    expect(page).to  have_content 'test_user@gmail.com'

  end

  #ログイン確認テスト
  scenario "ログインした後に、ヘッダーにログイン者の名前があるかどうかのテスト" do
    visit new_session_path
   
    fill_in "Email",	with: "testuser@gmail.com"
    fill_in "Password",	with: "000000"
    
    click_button 'Log in'
    save_and_open_page
    
    expect(page).to have_content "testuser"
  end

  #ユーザー詳細画面の確認テスト
  scenario "ユーザー名をクリックするとユーザー詳細画面が見れるかどうかのテスト" do
    visit new_session_path
   
    fill_in "Email",	with: "testuser@gmail.com"
    fill_in "Password",	with: "000000"
    
    click_button 'Log in'

    click_link 'testuser'
    save_and_open_page
    expect(page).to have_content "testuser"
    expect(page).to have_content "testuser@gmail.com"
  end
  
  #ログアウト確認テスト
  scenario "ログアウトした後にログイン画面が出てくるかどうかのテスト" do
  
  visit new_session_path
   
  fill_in "Email",	with: "testuser@gmail.com"
  fill_in "Password",	with: "000000"
  
  click_button 'Log in'

  click_link 'ログアウト'
  save_and_open_page

  expect(page).to have_current_path "/sessions/new"
  end
end

