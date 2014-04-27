class Item < ActiveRecord::Base
  
  # Associations
  
  has_many :user_items
  has_many :users, :through => :user_items
  belongs_to :brand 
  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images
  
  # Attributes
  
  enum availability: [:available, :banned, :discontinued, :retired, :unreleased]
  enum exclusivity:  [:not_limited_edition, :limited_edition_not_numbered, :limited_edition_numbered]
  enum gender: [:neutral, :both, :female, :male, :unisex] 
  enum packaging_type: [:unknown, :no_packaging, :bagged, :boxed, :carded, :cased, :tubed]
  
  # Validations
  
  validates :name, presence: true
  validates :brand_id, presence: true
  
  # Methods
  
  # Picks an image to display
  def image
    if( images.size == 0 )
      Image.item_default
    else
      images.last
    end
  end
  
  # Returns the filename for the image for this item
  def filename(extension)
    "#{id}_#{gender}.#{extension}"
  end
  
  def haves
    users.where(:user_items => { status: "have" } )
  end
  
  def wants
    users.where(:user_items => { status: "want" } )
  end
  
end