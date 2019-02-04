require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do

  #テストで使用するデータを共通化
  background do
    FactoryBot.create(:task)
    # FactoryBot.create(:task, title: '付け加えた名前１')
    FactoryBot.create(:second_task)
  end

  #タスク一覧のテスト
  scenario "タスク一覧画面に遷移したら、作成済みのタスクが表示される" do
    visit tasks_path

    expect(page).to have_content 'testtesttest'
    expect(page).to have_content 'samplesample'
  end

  #タスク作成のテスト
  scenario "タスク登録画面で、必要項目を入力してcreateボタンを押したらデータが保存される1" do
    visit new_task_path

    fill_in "タイトル",	with: "daikigoto" 
    fill_in "内容",	with: "im at the school" 

    click_on '登録する'

    expect(page).to  have_content 'im at the school'
  end

  #タスク詳細のテスト
  scenario "任意のタスク詳細画面に遷移したら、該当タスクの内容が表示されたページに遷移する" do
    visit tasks_path

    click_link '詳細', match: :first

    expect(page).to have_content 'samplesample'
  end

  #タスク並び替えのテスト
  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    visit tasks_path

    expect(Task.order("created_at DESC").map(&:id)).to eq [9,8]
  end
  
  #タスクへのカラム追加確認テスト
  scenario "タスクに終了期限が登録されているのかをテスト" do
    visit new_task_path
    
    fill_in "タイトル",	with: "終了期限" 
    fill_in "内容",	with: "機能の追加" 
    fill_in "終了期限",	with: "2019-02-10" 
    
    click_on '登録する'
    
    expect(page).to  have_content '2019-02-10'
  end

  #タスクの絞り込み検索テスト
  scenario "タスクの絞り込み検索ができるかをテスト" do
    visit tasks_path
    
    fill_in "タイトル検索",	with: "test_task_01" 
    select '完了', from: 'ステータス検索'
    
    click_on '検索'
    
    save_and_open_page
    expect(page).to  have_content 'testtesttest'
  end

end

