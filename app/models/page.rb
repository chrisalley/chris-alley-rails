class Page < ActiveRecord::Base
  acts_as_url :name, :sync_url => true
  
  def to_param
    url
  end
      
  validates :name, :presence => true, :length => { :in => 1..75 }, :uniqueness => true
  validates :content, :presence => true
end
