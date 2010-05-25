class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content

  embedded_in :entry, :inverse_of => :comments

  named_scope :reverse_chronological, criteria.order_by( [:created_at, :desc] )
end
