FactoryBot.define do
  factory :address do
    association :event
    postcode       { "062-0901" }
    place          { "北海道札幌市豊平区豊平一条一丁目1-2" }
    place_building { "コート豊平607" }
    latitude       { 42.9393 }
    longitude      { 143.187 }
  end
end