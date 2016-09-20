class Apartment < ActiveRecord::Base
  geocoded_by :street1
  after_validation :geocode
end
