#encoding:UTF-8
class Program < ActiveRecord::Base
  
  has_many :users, :payments
  
end
