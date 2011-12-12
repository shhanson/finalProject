class Restaurant < ActiveRecord::Base
  attr_accessible :name, :address, :city, :state, :zip, :phone, :www
  has_many :reviews
end
