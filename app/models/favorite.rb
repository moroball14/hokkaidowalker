class Favorite < ApplicationRecord
  belongs_to :event, counter_cache: :likes_count
  belongs_to :user
end
