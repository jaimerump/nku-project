class Brand < ActiveRecord::Base
  
  has_many :items
  has_many :images, as: :imageable
  
  def image
    if( images.size == 0 )
      Image.brand_default
    else
      images.last
    end
  end
  
end