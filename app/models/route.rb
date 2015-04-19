class Route < ActiveRecord::Base
  validates :agency_id, presence: true
  validates :obid, presence: true

  def display_name
    long_name.blank? ? "Route #{ self.short_name }" : long_name
  end
end
