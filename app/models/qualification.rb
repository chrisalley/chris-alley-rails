class Qualification < ActiveRecord::Base

  include Sluggable

  validates :name, presence: true, length: { in: 1..75 }, uniqueness: true
  validates :content, presence: true
  validates :year_completed, presence: true, numericality: { only_integer: true }
  
  mount_uploader :certificate, CertificateUploader

end
