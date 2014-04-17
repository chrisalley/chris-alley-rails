module Authenticatable
  extend ActiveSupport::Concern
  
  included do
  
    has_secure_password
    
    before_create :set_default_administrator
    before_create :generate_authentication_token   
    
    def self.find_by_name_or_email_address(name_or_email_address)
      find_by_name(name_or_email_address) or find_by_email_address(name_or_email_address)
    end
    
    # Sets default administrator if user is the first user.
    def set_default_administrator
      User.count < 1 ? self.role = :administrator.to_s : self.role = :registered.to_s
    end
    
    def generate_authentication_token
      self.authentication_token = SecureRandom.urlsafe_base64
    end
      
  end
end
