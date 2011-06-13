#encoding:UTF-8
class Program < ActiveRecord::Base
  
  has_many :users
  has_many :payments
  
end
