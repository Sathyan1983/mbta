class Route < ActiveRecord::Base
  validates :agency_id, presence: true
  validates :obid, presence: true
end
