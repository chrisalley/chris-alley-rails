class User < ActiveRecord::Base

  include Authenticatable
  include Sluggable
  
  validates :name, presence: true, length: { in: 1..50 }, uniqueness: true
  validates :email_address, presence: true, length: { in: 1..50 }, uniqueness: true
  validates_presence_of :password, on: :create
  
  ROLES = %w[administrator registered guest]
  
  # Returns true if user belongs to the specified role.
  def role?(role)
    self.role == role.to_s ? true : false
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
