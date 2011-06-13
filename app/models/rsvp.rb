class Rsvp < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :program
  has_one :payments
  
end
