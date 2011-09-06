class Malladmin < ActiveRecord::Base
  
  acts_as_authentic do |c|
    c.validate_email_field = false
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
