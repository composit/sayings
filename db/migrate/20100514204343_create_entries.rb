class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.integer :user_id
      t.integer :parent_id
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
