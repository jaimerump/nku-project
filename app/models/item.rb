class Item < ActiveRecord::Base
  
  has_many :images, as: :imageable
  has_many :user_items
  has_many :users, :through => :user_items
  belongs_to :brand 
  
  def image
    if( images.size == 0 )
      Image.item_default
    else
      images.last
    end
  end
  
end 