class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password
    
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true 
  
  before_save :create_remember_token
  
  private
  
   def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
   end
  
 end
