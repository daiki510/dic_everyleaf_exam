require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do
  feature '一覧表示機能' do
    #ユーザー１を作成する
    let(:user_01) { FactoryBot.create(:user, name: 'testuser_01', email: 'testuser_01@gmail.com') } 
    let(:user_02) { FactoryBot.create(:user, name: 'testuser_02', email: 'testuser_02@gmail.com') } 

    before do
      #作成者がユーザー１であるタスクを作成する
      FactoryBot.create(:task, user: user_01)

      #ユーザー1でログインする
      visit new_session_path
      fill_in 'Email', with: login_user.email
      fill_in 'Password',	with: login_user.password
      click_button 'Log in'
    end

    context "ユーザー1がログインしている時" do
      let(:login_user) { user_01 } 

      scenario "ユーザー1が作成したタスクが表示される" do
        #作成済みのタスクの名称が画面上に表示されていることを確認
        expect(page).to have_content 'testtesttest'
      end
    end
    context "ユーザー2がログインしている時" do
      let(:login_user) { user_02 } 

      scenario "ユーザー1が作成したタスクが表示されない" do
        #作成済みのタスクの名称が画面上に表示されないことを確認
        save_and_open_page
        expect(page).not_to have_content 'testtesttest'
      end
    end
  end
end


#   #タスク一覧のテスト
#   scenario "タスク一覧画面に遷移したら、作成済みのタスクが表示される" do

#       # visit new_session_path
   
#       # fill_in "Email",	with: "test01@gmail.com"
#       # fill_in "Password",	with: "test01"
      
#       # click_button 'Log in'
#       # save_and_open_page
    
#     visit tasks_path
    
#     expect(page).to have_content 'testtesttest'
#     # expect(page).to have_content 'samplesample'
    
#   end

#   #タスク作成のテスト
#   scenario "タスク登録画面で、必要項目を入力してcreateボタンを押したらデータが保存される1" do
#     visit new_task_path

#     fill_in "タイトル",	with: "diveintocode" 
#     fill_in "内容",	with: "プログラミングスクールです" 
    
#     click_on '登録する'
    
#     save_and_open_page
    
#     expect(page).to  have_content 'testtesttest'
    
#   end

#   #タスク並び替えのテスト
#   scenario "タスクが作成日時の降順に並んでいるかのテスト" do
#     visit tasks_path
   
#     expect(Task.order("created_at DESC").map(&:id)).to eq [7,6]
#   end
  
#   #タスクへのカラム追加確認テスト
#   scenario "タスクに終了期限が登録されているのかをテスト" do
#     visit new_task_path
    
#     fill_in "タイトル",	with: "終了期限" 
#     fill_in "内容",	with: "機能の追加" 
#     fill_in "終了期限",	with: "2019-02-10" 
    
#     click_on '登録する'
    
#     expect(page).to  have_content '2019-02-10'
#   end

#   #タスクの絞り込み検索テスト
#   scenario "タスクの絞り込み検索ができるかをテスト" do
#     visit tasks_path
    
#     fill_in "タイトル検索",	with: "test_task_01" 
#     select '完了', from: 'ステータス検索'
    
#     click_on '検索'
    
#     expect(page).to  have_content 'testtesttest'
#   end

#   #タスクの優先順位登録テスト
#   scenario "タスクの優先順位を登録できるかテスト" do
#     visit new_task_path
    
#     fill_in "タイトル",	with: "test_step_16" 
#     fill_in "内容",	with: "優先順位の追加の確認" 
#     fill_in "終了期限",	with: "2019-02-10" 
#     select '完了', from: 'ステータス'
#     select '中', from: '優先順位'
    
#     click_on '登録する'
    
    
#     expect(page).to  have_content '中'

#   end

# end

