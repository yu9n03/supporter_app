class Record < ApplicationRecord
  belongs_to :user
  belongs_to :target, optional: true

  validates :weight, presence: true, format: { with: /\A([0-9]{2,3})(\.[0-9]{1,2})?\z/ }
  validates :assessment, presence: true
  validates :input_day, presence: true
end
