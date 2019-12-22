FactoryBot.define do
  factory :user do
    nickname              { "testuser1" }
    email                 {"test@example.com" }
    password              { "aaaaaa" }
    password_confirmation { "aaaaaa" }
    avatar                { "aaa.jpg" }
  end
end