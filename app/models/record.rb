class Record < ApplicationRecord
  belongs_to :user
  belongs_to :target, optional: true

  validates :weight, presence: true, format: { with: /\A([0-9]{2,3})(\.[0-9]{1,2})?\z/ }
  validates :body_fat, format: { with: /\A([0-9]{2})(\.[0-9]{1,2})?\z/ }
  validates :assessment_id, presence: true, numericality: true
  validates :input_day, presence: true
end
