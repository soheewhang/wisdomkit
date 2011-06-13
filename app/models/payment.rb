#encoding:UTF-8
class Payment < ActiveRecord::Base
  
  belongs_to :rsvp
  
end
