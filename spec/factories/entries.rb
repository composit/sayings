Factory.define :entry do |f|
  f.user { |a| a.association( :user ) }
end
