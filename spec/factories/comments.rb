Factory.define( :comment ) do |f|
  f.user { |a| a.association( :user ) }
end
