class Event < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favoriting_users, through: :favorites, source: :user

  validates :name, presence: true
  validates :start, presence: true
  validates :end_on, presence: true
  validates :category_id, presence: true

  # validate :pretend_ago

  # def pretend_ago
  #     errors.add(:end_on, '終了日は開始日以降にしてください') if end_on.nil? || end_on < start
  # end


end
