class User < ActiveRecord::Base
  acts_as_url :name, :sync_url => true
  
  def to_param
    url 
  end
 
  has_secure_password
  before_create :set_default_administrator
  before_create { generate_token(:authentication_token) }
  
  validates :name, :presence => true, :length => { :in => 1..50 }, :uniqueness => true
  validates :email_address, :presence => true, :length => { :in => 1..50 }, :uniqueness => true
  validates_presence_of :password, :on => :create
  
  ROLES = %w[administrator registered guest]
  
  # Returns true if user belongs to the specified role.
  def role?(role)
    self.role == role.to_s ? true : false
  end
  
  # Sets default administrator if user is the first user.
  def set_default_administrator
    User.count < 1 ? self.role = :administrator.to_s : self.role = :registered.to_s
  end
  
  # Finds the user by either the user's name or email address.
  def self.find_by_name_or_email_address(name_or_email_address)
    user = find_by_name(name_or_email_address) || user = find_by_email_address(name_or_email_address)
  end
  
  # Generates and emails password reset token.
  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end
  
  # Generates a unique token.
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end