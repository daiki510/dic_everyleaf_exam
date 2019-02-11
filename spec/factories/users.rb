FactoryBot.define do
  factory :user do
    name { "testuser" }
    email { "testuser@gmail.com" }
    password { "000000" }
  end

  factory :admin_user, class: User do
    name { "admin_user" }
    email { "admin@gmail.com" }
    password { "000000" }
    admin {"true"}
  end
end
