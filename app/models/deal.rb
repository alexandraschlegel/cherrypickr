class Deal < ApplicationRecord
  belongs_to :supermarkets
  belongs_to :products
end
