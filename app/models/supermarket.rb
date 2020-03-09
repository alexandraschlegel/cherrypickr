class Supermarket < ApplicationRecord
  has_many :products
  has_many :deals
  has_many :branches

  def self.all_branches
    self.all.map(&:branches)
  end
end
