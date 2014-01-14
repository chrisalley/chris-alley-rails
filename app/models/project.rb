class Project < ActiveRecord::Base
  acts_as_url :name, sync_url: true

  def to_param
    url
  end

  validates :name, presence: true, length: { :in => 1..75 }, uniqueness: true
  validates :content, presence: true
  validates :priority, presence: true, numericality: { only_integer: true }
  
  mount_uploader :screenshot, ScreenshotUploader
end
