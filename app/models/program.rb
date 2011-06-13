class Program < ActiveRecord::Base
  
  has_many :users, :payments
  
end
