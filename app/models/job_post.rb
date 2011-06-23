class JobPost < ActiveRecord::Base
  default_scope :order => 'title'
  # has_many :line_items
  # before_destroy :ensure_not_referenced_by_any_line_item
  
  validates_presence_of [:title, :company, :description, :location, :experience, :skills,
                         :industry, :pay]
  validates_uniqueness_of :title
  validates :pay, :numericality => {:greater_than_or_equal_to => 0.01}
  
  # private
  #     # Ensure there are no line items referencing this product
  #     def ensure_not_referenced_by_any_line_item
  #       if line_items.empty?
  #         return true
  #       else
  #         errors.add(:base, 'Line items present.')
  #         return false
  #       end
  #     end
end