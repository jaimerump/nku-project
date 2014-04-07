class UserItem < ActiveRecord::Base
  # Represents a have or a want
  belongs_to :item
  belongs_to :user
  
end
