class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :age, format: { with: /\A\d{2}\z/ }
    validates :height, format: { with: /\A([1-2]{1}[0-9]{2})(\.[0-9]{1})?\z/ }
    validates :basis_weight, format: { with: /\A([0-9]{2,3})(\.[0-9]{1,2})?\z/ }
  end
  has_one :target, dependent: :destroy
  has_one :room, dependent: :destroy
  has_many :records, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :reservation, dependent: :destroy
end
