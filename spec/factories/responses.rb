Factory.define( :response ) do |f|
  f.exchange { |a| a.association( :exchange ) }
  f.user { |a| a.association( :user ) }
end
