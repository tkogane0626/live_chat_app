class Message < ApplicationRecord
  belongs_to :user

  # validates :content, precense: true
end
