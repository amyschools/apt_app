class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "50x50#" },
  :default_url => "default_image_:style.jpeg"

 validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_many :apartments

end
