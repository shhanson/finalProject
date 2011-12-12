class Review < ActiveRecord::Base
  attr_accessible :user_id, :restaurant_id, :content
  belongs_to :restaurant
  belongs_to :user
  
  validates :user_id, :presence => true
  validates :restaurant_id, :presence => true
  validates :content, :presence => true,
                      :length => { :maximum => 500 }
                      
  default_scope :order => 'reviews.created_at DESC'
                      
                      
  self.per_page = 10
  
  
  
  
end
