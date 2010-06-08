class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :user_id
  field :content

  belongs_to_related :user
  has_one_related :exchange
  embedded_in :entry, :inverse_of => :comments

  validates :user_id, :presence => true

  def new_exchange
    @new_exchange ||= build_new_exchange
  end

  def child_exchange
    Exchange.where( :parent_comment_id => id ).first
  end

  private
    def build_new_exchange
      exch = Exchange.new( :parent_comment_id => id, :parent_entry_id => entry.id, :parent_exchange_id => entry.exchange.id )
      exch.users << entry.user
      exch.users << user
     
      entry_1 = Entry.new( :user_id => entry.user_id, :content => entry.content, :created_at => entry.created_at, :updated_at => entry.updated_at )
      entry_2 = Entry.new( :user_id => user_id, :content => content, :created_at => created_at, :updated_at => updated_at )
      exch.entries << entry_1
      exch.entries << entry_2
      exch
    end
end
