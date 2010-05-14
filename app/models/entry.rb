class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :parent, :class_name => "Entry"
  has_many :children, :class_name => "Entry", :foreign_key => "parent_id"
end
