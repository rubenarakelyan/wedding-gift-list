class Gift < ApplicationRecord
  has_many :purchased_gifts
  has_many :guests, through: :purchased_gift
  validates :name, :price, :image_url, presence: true
  validates :price, numericality: { only_integer: true }

  def human_price
    price / 100
  end

  def human_price_remaining
    price_remaining / 100
  end

  def price_paid
    purchased_gifts.sum(:paid)
  end

  def price_remaining
    price - price_paid
  end

  def available?
    price_remaining > 0
  end

  def unavailable?
    !available?
  end

  def purchases?
    !purchased_gifts.empty?
  end
end
