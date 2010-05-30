class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :user_id
  field :content

  belongs_to_related :user
  has_one_related :exchange
  embedded_in :entry, :inverse_of => :comments

  def new_exchange
    exchange.build
    exchange.users << [ entry.user, user ]
    exchange
  end
end
