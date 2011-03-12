class CreateStories < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.string :body
      t.string :state

      t.timestamps
    end
    add_index :stories, :state
  end

  def self.down
    remove_index :stories, :column => :state
    drop_table :stories
  end
end
