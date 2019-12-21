FactoryBot.define do
  factory :event do
    name        { "イベント名" }
    start       { Date.today }
    end_on      { Date.today }
    url         { "password" }
    category_id { "1" }
    user_id     { "1" }
  end
end