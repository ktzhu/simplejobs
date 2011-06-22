class MigrationToAddCompany < ActiveRecord::Migration
  def self.up
    add_column :job_posts, :company, :string
  end

  def self.down
    remove_column :job_posts, :company
  end
end
