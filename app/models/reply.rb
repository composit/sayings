class Reply < Entry
  include Mongoid::Document

  # embedded_in :exchange, :inverse_of => :replies
end
