class Reply
  include Mongoid::Document
  include Mongoid::Timestamps

  field :user_id
  field :content

  index :created_at

  belongs_to_related :user
  embeds_many :comments

  embedded_in :exchange, :inverse_of => :replies
end
