class User < ActiveRecord::Base
  
  has_many :programs, :payments
  
end
