class Exchange
  include Mongoid::Document
  include Mongoid::Timestamps

  field :parent_comment_id
  field :parent_entry_id
  field :parent_exchange_id
  field :user_ids, :type => Array, :default => []
  field :most_recent_entry_date, :type => Time, :default => Time.now

  index :user_ids

  embeds_many :entries
  belongs_to_related :parent_exchange, :class_name => "Exchange"

  before_validation :set_user_ids

  named_scope :top_level, :where => { :parent_comment_id => nil, :parent_entry_id => nil, :parent_exchange_id => nil }

  def users
    @users ||= User.where( :_id.in => user_ids ).to_a
  end

  def entries_attributes=( attributes_array )
    # until mongoid supports accepts_nested_attributes_for fully
    attributes_array.each do |entry_attributes|
      entry = entries.create( entry_attributes )
      entry.save
    end
  end

  def ordered_entries
    entries.sort { |x,y| x.created_at <=> y.created_at }
  end

  protected
    def set_user_ids
      self.user_ids = users.uniq.compact.collect { |user| user.id }
    end
end
