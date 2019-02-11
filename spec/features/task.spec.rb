require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do
  #ユーザー1を作成する
  let(:user_01) { FactoryBot.create(:user, name: 'testuser_01', email: 'testuser_01@gmail.com') } 
  #ユーザー2を作成する
  let(:user_02) { FactoryBot.create(:user, name: 'testuser_02', email: 'testuser_02@gmail.com') } 
  #ユーザー1でタスク1を作成する
  let!(:task_01) { FactoryBot.create(:task, user: user_01) } 

  before do
    #ユーザー1でログインする
    visit new_session_path
    fill_in 'Email', with: login_user.email
    fill_in 'Password',	with: login_user.password
    click_button 'Log in'
  end
  
  #表示されるタスクの共通化
  shared_examples_for  "ユーザー1が作成したタスクが表示される" do
    it { expect(page).to have_content 'testtesttest' } 
  end
  

  feature '一覧表示機能' do
    context "ユーザー1がログインしている時" do
      let(:login_user) { user_01 } 
      it_behaves_like "ユーザー1が作成したタスクが表示される"
    end

    context "ユーザー2がログインしている時" do
      let(:login_user) { user_02 } 

      it "ユーザー1が作成したタスクが表示されない" do
        #作成済みのタスクの名称が画面上に表示されないことを確認
        expect(page).not_to have_content 'testtesttest'
      end
    end
  end

  feature '詳細表示機能' do
    context "ユーザー1がログインしている時" do
      let(:login_user) { user_01 } 

      before do
        #詳細画面に移動
        visit task_path(task_01)
      end

      it_behaves_like "ユーザー1が作成したタスクが表示される"
    end
  end

  feature '新規作成機能' do
    let(:login_user) { user_01 } 

    before do 
      visit new_task_path
      fill_in "タイトル", with: task_name
      fill_in "内容", with: "新規作成の内容が書かれています"
      click_button "登録する"
    end

    context "新規作成画面で名称を入力した時" do
      let(:task_name) { "新規作成のテスト" } 

      it "正常に登録される" do 
        expect(page).to have_selector ".notice", text: "タスク「新規作成のテスト」を登録しました"
      end
    end
    
    context "新規作成画面で名称を入力しなかった時" do
      let(:task_name) { "" } 
      
      it "エラーとなる" do
        within "#error_explanation" do
          expect(page).to have_content "タイトルを入力してください"
        end
      end
    end
  end
end