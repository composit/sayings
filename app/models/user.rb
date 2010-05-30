class User
  include Mongoid::Document
  include Mongoid::Timestamps

  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable and :timeoutable, :confirmable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  field :username
  field :website_url

  has_many_related :entries
  has_many_related :replies
  has_many_related :comments

  validates :website_url, :allow_blank => true, :url_exists => true

  def exchanges
    Exchange.where( :user_ids => id )
  end

=begin
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
=end
end
