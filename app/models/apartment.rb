class Apartment < ActiveRecord::Base

  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100#" }
 validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def full_address
    @street = street1
    @city = city
    @postalcode = postalcode
    @full_address = @street + " " + @city + " " + @postalcode
  end

  geocoded_by :full_address
  after_validation :geocode

  belongs_to :user

end
