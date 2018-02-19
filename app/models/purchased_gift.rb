class PurchasedGift < ApplicationRecord
  belongs_to :gift
  belongs_to :guest
  validates :gift, :guest, :paid, presence: true
  validates :paid, numericality: { only_integer: true }
  before_create :generate_transaction_id

  private

  def generate_transaction_id
    self.transaction_id = SecureRandom.uuid
  end
end
