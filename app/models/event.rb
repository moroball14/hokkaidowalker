class Event < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
end
