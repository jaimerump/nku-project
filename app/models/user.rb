class User < ActiveRecord::Base
  has_secure_password
  
  has_many :images, as: :imageable
  
  validates :email, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def image
    if( images.size == 0 )
      Image.user_default
    else
      images.last
    end
  end
  
end
