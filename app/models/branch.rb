class Branch < ApplicationRecord
  belongs_to :supermarket

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  before_save :check_coordinates

  def check_coordinates
    if self.latitude == nil
      self.latitude = 51.508192
      self.longitude = -0.127940
    end
  end
end
