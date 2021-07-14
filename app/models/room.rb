class Room < ApplicationRecord
  belongs_to :user
  has_one :target
  has_many :records
  has_many :messages
end
