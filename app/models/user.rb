class User < ActiveRecord::Base
  acts_as_authentic

  validates :website_url, :allow_blank => true, :url_exists => true
end
