class Product < ApplicationRecord
  has_many :deals
  belongs_to :supermarket
  has_many :user_products, dependent: :destroy

    include PgSearch::Model
  pg_search_scope :search_by_name,
    against: :name,
    using: {
      tsearch: { prefix: true }
    }
  before_save :set_price_cents

  private

  def set_price_cents
    self.price_cents = price.split("£")[1]&.strip.to_f * 100
  end

end
