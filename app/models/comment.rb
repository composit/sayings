class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :user_id
  field :content

  belongs_to_related :user
  has_one_related :exchange
  embedded_in :commentable, :inverse_of => :comments

  validates :user_id, :presence => true

  def new_exchange
    exchange.build
    exchange.users << commentable.user
    exchange.users << user
    exchange.replies.build( commentable.attributes )
    exchange.replies.build( :user_id => user_id, :content => content, :created_at => created_at, :updated_at => updated_at )
    exchange
  end
end
