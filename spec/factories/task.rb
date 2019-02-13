FactoryBot.define do
  factory :task do
    title { 'test_task_01' }
    content { 'testtesttest' }
    deadline { '2019-02-03' }
    status {'完了'}
    priority {'中'}
    user
    
    after(:create) do |task|
      create(:label, tasks: [task])
    end
  end
end