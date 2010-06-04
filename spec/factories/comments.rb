Factory.define( :comment ) do |f|
  f.entry { |a| a.association( :entry ) }
  f.user { |a| a.association( :user ) }
end
