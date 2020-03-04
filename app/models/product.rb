class Product < ApplicationRecord
  has_many :deals
  belongs_to :supermarket

    include PgSearch::Model
  pg_search_scope :search_by_name,
    against: :name,
    using: {
      tsearch: { prefix: true }
    }

end
