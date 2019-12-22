FactoryBot.define do
  factory :event do
    association :user
    name        { "イベント名" }
    start       { Date.today }
    end_on      { Date.today }
    url         { "password" }
    category_id { "1" }
  end
end