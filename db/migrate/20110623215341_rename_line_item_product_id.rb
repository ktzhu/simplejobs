class RenameLineItemProductId < ActiveRecord::Migration
  def self.up
    rename_column(:line_items, :product_id, :job_post_id)
  end

  def self.down
    rename_column(:line_items, :job_post_id, :product_id)
  end
end
