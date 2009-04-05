class AddNewTimestampsToStory < ActiveRecord::Migration
  def self.up
    add_column :stories, :approved_at, :time
    add_column :stories, :rejected_at, :time
    add_column :stories, :marked_as_spam_at, :time
    add_column :stories, :published_at, :time
  end

  def self.down
    remove_column :stories, :approved_at
    remove_column :stories, :rejected_at
    remove_column :stories, :marked_as_spam_at
    remove_column :stories, :published_at
  end
end
