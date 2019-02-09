require 'rails_helper'

RSpec.feature "管理者によるユーザー管理機能", type: :feature do

  feature 'ユーザー一覧機能' do
    let(:admin_user_01){FactoryBot.create(:admin_user)}
    let(:user_01){FactoryBot.create(:user)}

    before do 
      visit new_session_path
      fill_in 'Email', with: login_user.email
      fill_in 'Password',	with: login_user.password
      click_button 'Log in'
    end

    context "管理者がログインしている時" do
      let(:login_user) { admin_user_01 }
      it "ユーザー管理が表示される" do
        save_and_open_page
        expect(page).to have_content 'ユーザー管理'
      end
    end

    context "一般ユーザーがログインしている時" do
      let(:login_user) { user_01 }
      it "ユーザー管理が表示されない" do
        expect(page).not_to have_content 'ユーザー管理'
      end
    end
  end
    
  feature '新規登録機能' do

    before do 
      #管理者ユーザーでログインする
      FactoryBot.create(:admin_user)
      visit new_session_path
      fill_in 'Email', with: "admin@gmail.com"
      fill_in 'Password',	with: "000000"
      click_button 'Log in'
    end

    context "管理者権限にチェックを入れる" do
      it "新規管理者ユーザーは、ユーザー管理画面へアクセスできる" do
        visit new_admin_user_path
      
        fill_in '名前', with: "admin_user_01"
        fill_in 'メールアドレス', with: "admin_01@gmail.com"
        fill_in 'パスワード',	with: "000000"
        fill_in "パスワード確認用",	with: "000000" 
        check "管理者権限"
        
        click_button '登録する'
  
        click_link 'ログアウト'
        
        #新規管理者ユーザーでログインする
        visit new_session_path
        fill_in 'Email', with: "admin_01@gmail.com"
        fill_in 'Password',	with: "000000"
        click_button 'Log in'
  
        expect(page).to have_content 'ユーザー管理'
      end
    end
  end

  feature '編集機能' do
    before do 
      #管理者ユーザーでログインする
      FactoryBot.create(:admin_user)
      @user = FactoryBot.create(:user) 
      visit new_session_path
      fill_in 'Email', with: "admin@gmail.com"
      fill_in 'Password',	with: "000000"
      click_button 'Log in'
      click_link 'ユーザー管理'
    end
    
    context "管理者が一般ユーザーの編集画面へ" do
      it "名前を編集すると変更されているかどうか" do
        visit edit_admin_user_path(@user.id)

        fill_in "名前",	with: "testuser_update" 
        click_button '更新する'
        
        expect(page).to have_content 'testuser_update'
      end
    end
  end

  feature '削除機能' do
    before do 
      #管理者ユーザーでログインする
      FactoryBot.create(:admin_user)
      @user = FactoryBot.create(:user) 
      visit new_session_path
      fill_in 'Email', with: "admin@gmail.com"
      fill_in 'Password',	with: "000000"
      click_button 'Log in'
      click_link 'ユーザー管理'
    end

    context "管理者がユーザー管理画面へ" do
      it "削除ボタンを押した時に削除されているかどうか" do
       
        find('.delete_link').click

        # save_and_open_page
        expect(page).not_to have_content 'testuser@gmail.com'
      end
    end
  end
end