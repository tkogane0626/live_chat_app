class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  include DeviseTokenAuth::Concerns::User

  has_many :messages, dependent: nil

  validates :name, presence: true, length: { maximum: 30 }
end
