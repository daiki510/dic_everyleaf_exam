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

    # save_and_open_page
    
    # expect(page).to have_content 'testtesttest'
    expect(page).to have_content 'samplesample'
  end

  scenario "タスクが作成日時の降順に並んでいるかのテスト" do
    visit tasks_path
    # save_and_open_page
    expect(Task.order("created_at DESC").map(&:id)).to eq [9,8]
  end
end

