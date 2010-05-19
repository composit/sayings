class Entry < ActiveRecord::Base
  default_scope order( "created_at desc" )

  belongs_to :user
  belongs_to :parent, :class_name => "Entry"
  has_many :children, :class_name => "Entry", :foreign_key => "parent_id"

  validates :user_id, :presence => true
end
