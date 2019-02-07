FactoryBot.define do
  factory :user do
    name { "testuser" }
    email { "testuser@gmail.com" }
    password { "000000" }
  end
end
