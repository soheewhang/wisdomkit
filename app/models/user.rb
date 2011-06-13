#encoding:UTF-8
class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation, :phone_number, :birthday, :group
  
  has_many :programs
  has_many :payments
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # Korean + Alphabet letters
  name_regex = /^[a-zA-Z]+( [a-zA-Z]+)*$|^[가-힣]*$/
  
  validates :name, :presence => true,
                    :length => { :maximum => 50 },
                    :format => { :with => name_regex }
  validates :email, :presence => true,
                    :format   => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }                    
  validates :password, :presence => true,
                        :confirmation => true,
                        :length => { :within => 6..40 },
                        :if => :password_required?
  
  before_save :encrypt_password
  
  def password_required?
    !persisted? || password.present? || password_confirmation.present?
  end
  
  # Return true if the user's password matches the submitted password
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end
  
  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end
  
  private
  
  def encrypt_password
    self.salt = make_salt if new_record?
    self.encrypted_password = encrypt(password)
  end
  
  def encrypt(string)
    secure_hash("#{salt}--#{string}")
  end
  
  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end
  
  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end
  
end

