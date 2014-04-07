class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  
  DEFAULT_HEIGHT = 220
  DEFAULT_WIDTH = 220
  
  def self.user_default
    default = Image.new
    default.url = "https://www.completeset.com/users/placeholder.png"
    default.height = DEFAULT_HEIGHT
    default.width = DEFAULT_WIDTH
    default
  end
  
  def self.item_default
    default = Image.new
    default.url = "https://df1pcbhp0ir50.cloudfront.net/items/placeholder.jpg"
    default.height = DEFAULT_HEIGHT
    default.width = DEFAULT_WIDTH
    default
  end
  
  def self.brand_default
    default = Image.new
    default.url = "https://www.completeset.com/brands/10002.png"
    default.height = DEFAULT_HEIGHT
    default.width = DEFAULT_WIDTH
    default
  end
  
end
