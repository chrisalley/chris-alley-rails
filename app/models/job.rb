class Job < ActiveRecord::Base
  acts_as_url :name, sync_url: true

  def to_param
    url
  end

  validates :name, presence: true, length: { :in => 1..75 }, uniqueness: true
  validates :content, presence: true
  validates :organisation, presence: true
  validates :month_started, presence: true, numericality: { only_integer: true }
  validates :month_finished, presence: true, numericality: { only_integer: true }
  validates :year_started, presence: true, numericality: { only_integer: true }
  validates :year_finished, presence: true, numericality: { only_integer: true }
  validates :content, presence: true
end
