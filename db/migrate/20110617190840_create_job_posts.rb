class CreateJobPosts < ActiveRecord::Migration
  def self.up
    create_table :job_posts do |t|
      t.string :title
      t.text :description
      t.string :location
      t.text :experience
      t.text :skills
      t.string :industry
      t.decimal :pay, :precision => 8, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :job_posts
  end
end
