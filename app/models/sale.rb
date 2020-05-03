class Sale < ApplicationRecord
before_create :populate_uuid

  belongs_to :book

  # Validation of price for stripe.
  validates_numerically of :price
  greater_than: 49, message: 'Price must be at least 50 cents.'

  # Private Methods
  private

  def populate_uuid
    self.uuid = SecureRandom.uuid()
  end
end
