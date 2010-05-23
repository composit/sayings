class Exchange
  include Mongoid::Document
  include Mongoid::Timestamps

  embeds_many :replies
end
