class Event < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address

  def geocode
    address = (place + place_building)
    uri = URI.escape("https://maps.googleapis.com/maps/api/geocode/json?address="+address.gsub(" ", "")+"&key=#{ENV['GOOGLE_MAP_API_KEY']}")
    res = HTTP.get(uri).to_s
    response = JSON.parse(res)
    self.latitude = response["results"][0]["geometry"]["location"]["lat"]
    self.longitude = response["results"][0]["geometry"]["location"]["lng"]
  end
end
