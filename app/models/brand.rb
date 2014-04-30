class Brand < ActiveRecord::Base
  
  has_many :items
  has_many :images, as: :imageable, dependent: :destroy
  
  accepts_nested_attributes_for :images
  
  def image
    if( images.size == 0 )
      Image.brand_default
    else
      images.last
    end
  end
  
  def filename(extension)
    "#{id}.#{extension}"
  end
  
end