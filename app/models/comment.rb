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
    @new_exchange ||= build_new_exchange
  end

  private
    def build_new_exchange
      exch = self.exchange.build
      exch.users << commentable.user
      exch.users << user
     
      entry_response = Response.new( :user_id => commentable.user_id, :content => commentable.content, :created_at => commentable.created_at, :updated_at => commentable.updated_at )
      comment_response = Response.new( :user_id => user_id, :content => content, :created_at => created_at, :updated_at => updated_at )
      exchange.responses << entry_response
      exchange.responses << comment_response
      exch
    end
end
