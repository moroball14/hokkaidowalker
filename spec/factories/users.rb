FactoryBot.define do
  factory :user do
    nickname              { "testuser1" }
    email                 {"test@example.com" }
    password              { "password" }
    password_confirmation { "password" }
    avatar                { "aaa.jpg" }
  end
end