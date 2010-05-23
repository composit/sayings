class Comment
  include Mongoid::Document

  embedded_in :entry, :inverse_of => :comments
end
