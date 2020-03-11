class Supermarket < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :deals
  has_many :branches, dependent: :destroy


  def self.all_branches
    self.all.map(&:branches)

  end

  # def self.markers(query)
  #   self.where(name: query).all_branches.reduce.map do |branch|
  #     {
  #       lat: branch.latitude,
  #       lng: branch.longitude
  #     }
  #   end
  # end
end
