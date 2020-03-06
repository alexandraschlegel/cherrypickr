class Supermarket < ApplicationRecord
  has_many :products
  has_many :deals

  geocoded_by :postcode
  after_validation :geocode


  def postcode
    #only execute if an eddress available else it throws exception
    if !address.nil?
      address.split(",").last
    end
  end
end
