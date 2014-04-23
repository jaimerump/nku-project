class Item < ActiveRecord::Base
  
  has_many :images, as: :imageable
  has_many :user_items
  has_many :users, :through => :user_items
  belongs_to :brand 
  
  enum availability: [:available, :banned, :discontinued, :retired, :unreleased]
  enum exclusivity:  [:not_limited_edition, :limited_edition_not_numbered, :limited_edition_numbered]
  enum gender: [:neutral, :both, :female, :male, :unisex] 
  enum packaging_type: [:unknown, :no_packaging, :bagged, :boxed, :carded, :cased, :tubed]
  
  validates :name, presence:
  validates :brand_id, presence:
  
  def image
    if( images.size == 0 )
      Image.item_default
    else
      images.last
    end
  end
  
  def haves
    users.where(:user_items => { status: "have" } )
  end
  
  def wants
    users.where(:user_items => { status: "want" } )
  end
  
end