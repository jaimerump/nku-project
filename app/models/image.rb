class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  
  DEFAULT_HEIGHT = 220
  DEFAULT_WIDTH = 220
  MEDIA_FETCH_HOST = "https://df1pcbhp0ir50.cloudfront.net"
  ASSETS_FETCH_HOST = "https://d25m1i464od8gh.cloudfront.net"
  
  def self.user_default
    default = Image.new
    default.url = "#{MEDIA_FETCH_HOST}/users/placeholder.png"
    default.height = DEFAULT_HEIGHT
    default.width = DEFAULT_WIDTH
    default
  end
  
  def self.item_default
    default = Image.new
    default.url = "#{MEDIA_FETCH_HOST}/items/placeholder.jpg"
    default.height = DEFAULT_HEIGHT
    default.width = DEFAULT_WIDTH
    default
  end
  
  def self.brand_default
    default = Image.new
    default.url = "#{ASSETS_FETCH_HOST}/brands/10002.png"
    default.height = DEFAULT_HEIGHT
    default.width = DEFAULT_WIDTH
    default
  end
  
end
