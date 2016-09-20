class Apartment < ActiveRecord::Base

  def full_address
    @street = street1
    @city = city
    @postalcode = postalcode
    @full_address = @street + " " + @city + " " + @postalcode
  end

  geocoded_by :full_address
  after_validation :geocode

end
