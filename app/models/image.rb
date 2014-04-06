class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
  
  def self.user_default
    default = Image.new
    default.url = "https://www.completeset.com/users/placeholder.png"
    default.height = 220
    default.width = 220
    default
  end
  
end
