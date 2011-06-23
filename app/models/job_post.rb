class JobPost < ActiveRecord::Base
  default_scope :order => 'title'
  
  validates_presence_of [:title, :company, :description, :location, :experience, :skills,
                         :industry, :pay]
  validates :pay, :numericality => {:greater_than_or_equal_to => 0.01}
end