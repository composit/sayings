class Exchange
  include Mongoid::Document
  include Mongoid::Timestamps

  field :comment_id
  field :user_ids, :type => Array, :default => []

  index :user_ids

  embeds_many :replies
  belongs_to_related :comment

  before_validate :set_user_ids

  def users
    @users ||= User.where( :_id.in => user_ids )
  end

  protected
    def set_user_ids
      self.user_ids = users.collect { |user| user.id }
    end
end
