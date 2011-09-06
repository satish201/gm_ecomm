class Malladm < ActiveRecord::Base
   
   attr_accessor :password 
   attr_accessible :username, :password
  
  acts_as_authentic do |config|
# Add custom configuration options here.
  config.crypto_provider = Authlogic::CryptoProviders::MD5
  end
  
   
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :username,  :presence => true, :length => { :maximum => 30 }, :uniqueness => true
  validates :email, :presence => true, 
                    :format => {:with => email_regex},
                    :uniqueness => true
  
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => { :within => 6..20 }
end
