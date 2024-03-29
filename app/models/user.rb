class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events
  has_many :favorites, dependent: :destroy
  has_many :favorite_events, through: :favorites, source: :event
  
  validates :nickname, presence: true
  mount_uploader :avatar, AvatarUploader

end
