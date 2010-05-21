class Entry
  include Mongoid::Document
  include Mongoid::Timestamps

  field :user_id
  field :content

  scope :reverse_chronological, order_by( [:created_at, :desc] )

  belongs_to_related :user

  validates :user_id, :presence => true
end
