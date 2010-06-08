class Exchange
  include Mongoid::Document
  include Mongoid::Timestamps

  field :comment_id
  field :user_ids, :type => Array, :default => []
  field :most_recent_entry_date, :type => DateTime, :default => Time.now

  index :user_ids

  embeds_many :entries
  belongs_to_related :comment

  before_validate :set_user_ids

  named_scope :top_level, :where => { :comment_id => nil }

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

  protected
    def set_user_ids
      self.user_ids = users.uniq.compact.collect { |user| user.id }
    end
end
