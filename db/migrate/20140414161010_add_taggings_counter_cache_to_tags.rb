class AddTaggingsCounterCacheToTags < ActiveRecord::Migration
  def self.up
    add_column :tags, :taggings_count, :integer, :default => 0

    ActsAsTaggableOn::Tag.find_each do |tag|
      ActsAsTaggableOn::Tag.reset_counters(tag.id, :taggings)
    end
  end

  def self.down
    remove_column :tags, :taggings_count
  end
end