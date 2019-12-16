class Address < ApplicationRecord
  belongs_to :event

  validates :latitude, :numericality => { :greater_than => 140.1439347 }

  def geocode
    address = (place + place_building)
    uri = URI.escape("https://maps.googleapis.com/maps/api/geocode/json?address="+address.gsub(" ", "")+"&key=#{ENV['GOOGLE_MAP_API_KEY']}")
    res = HTTP.get(uri).to_s
    response = JSON.parse(res)
    unless response["status"] == "INVALID_REQUEST"
      self.latitude = response["results"][0]["geometry"]["location"]["lat"]
      self.longitude = response["results"][0]["geometry"]["location"]["lng"]
    end
  end
end
