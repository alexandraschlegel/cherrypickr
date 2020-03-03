class Product < ApplicationRecord
  has_many :deals
  belongs_to :supermarket
end
