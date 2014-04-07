class Item < ActiveRecord::Base
  
  has_many :images, as: :imageable
  
  def image
    if( images.size == 0 )
      Image.item_default
    else
      images.last
    end
  end
  
end