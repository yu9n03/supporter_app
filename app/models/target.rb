class Target < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :period

  belongs_to :user

  validates :goal_weight, presence: true, format: { with: /\A([0-9]{2,3})(\.[0-9]{1,2})?\z/ }
  validates :period_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :plan, presence: true
end
