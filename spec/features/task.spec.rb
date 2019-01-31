require 'rails_helper'

RSpec.feature "タスク管理機能", type: :feature do
  scenario "タスク一覧画面に遷移したら、作成済みのタスクが表示される" do
    Task.create!(title: 'test_task_01', content: 'testtesttest')
    Task.create!(title: 'test_task_02', content: 'samplesample')

    visit tasks_path

    expect(page).to have_content 'testtesttest'
    expect(page).to have_content 'samplesample'
  end

  scenario "タスク登録画面で、必要項目を入力してcreateボタンを押したらデータが保存される1" do
    visit new_task_path

    fill_in "Title",	with: "daikigoto" 
    fill_in "Content",	with: "im at the school" 

    click_on 'Create Task'

    expect(page).to  have_content 'im at the school'
  end

  scenario "任意のタスク詳細画面に遷移したら、該当タスクの内容が表示されたページに遷移する" do
    Task.create!(title: 'test_task_01', content: 'testtesttest')

    visit tasks_path

    click_link 'show'

    save_and_open_page
    
    expect(page).to have_content 'testtesttest'
  end
end

