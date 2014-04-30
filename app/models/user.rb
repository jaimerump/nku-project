class User < ActiveRecord::Base
  has_secure_password
  
  has_many :images, as: :imageable, dependent: :destroy
  has_many :user_items
  has_many :items, :through => :user_items
  
  validates :email, uniqueness: true
  
  accepts_nested_attributes_for :images

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
  
  def filename(extension)
    "#{id}.#{extension}"
  end
  
  # Have/want functions
  
  def haves 
    items.where(:user_items => { status: "have" } )
  end
 
  def wants 
    items.where(:user_items => { status: "want" } )
  end
  
  def has_item(item_id)
    !user_items.where(status: "have", item_id: item_id).empty?
  end
  
  def wants_item(item_id)
    !user_items.where(status: "want", item_id: item_id).empty?
  end
  
end
