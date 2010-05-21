class User < ActiveRecord::Base
  include Mongoid::Document

  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable and :timeoutable, :confirmable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  timestamps!

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation

  acts_as_authentic

  has_many :entries

  validates :website_url, :allow_blank => true, :url_exists => true
end
