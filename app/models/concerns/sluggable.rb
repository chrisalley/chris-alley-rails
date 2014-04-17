module Sluggable
  extend ActiveSupport::Concern
    
  included do
    acts_as_url :name, sync_url: true
  end
    
  def to_param 
    url 
  end  
end
