class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  
  validates :text, presence: true
  validates :user_nickname, presence: true
  validates :room_id, presence: true
end
