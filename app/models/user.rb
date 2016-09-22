class User < ActiveRecord::Base
  rolify


  after_create :assign_role

  def assign_role
    add_role(:owner)
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100#" },
  :default_url => "default_image_:style.jpeg"

 validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_many :apartments

  def self.from_omniauth(auth)
     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
       user.email = auth.uid + "@twitter.com"
       user.password = Devise.friendly_token[0,20]
     end
  end

  def self.new_with_sesison(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user| user.attributes = params
        user.valid?
      end
    else
      super
    end
  end #ends def

end #end class
