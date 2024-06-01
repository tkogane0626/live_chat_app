class Message < ApplicationRecord
  belongs_to :user

  has_many :likes, dependent: nil

  validates :content, presence: true
end
