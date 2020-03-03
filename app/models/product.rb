class Product < ApplicationRecord
  belongs_to :supermarkets
  has_many :deals
end
