FactoryBot.define do
  factory :user do
    name { "test01" }
    email { "test01@gmail.com" }
    password_digest { "test01" }
  end
end
