class Guest < ApplicationRecord
  has_one :purchased_gift
  has_one :gift, through: :purchased_gift
  validates :name, :email_address, presence: true
end
