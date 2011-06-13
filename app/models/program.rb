#encoding:UTF-8
class Program < ActiveRecord::Base
  
  has_many :users
  has_many :rsvps
  
  validates :title, :price, :period, :term, :presence => true
  
end
