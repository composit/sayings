class AllowUserWebsiteUrlToBeNil < ActiveRecord::Migration
  def self.up
    change_column :users, :website_url, :string, :null => true
  end

  def self.down
    change_column :users, :website_url, :string, :null => false
  end
end
