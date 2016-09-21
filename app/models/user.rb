class User < ActiveRecord::Base

  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "50x50#" },
  :default_url => "default_image_:style.jpeg"

 validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_many :apartments

end
