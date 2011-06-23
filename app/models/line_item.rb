class LineItem < ActiveRecord::Base
  belongs_to :job_post
  belongs_to :cart
end