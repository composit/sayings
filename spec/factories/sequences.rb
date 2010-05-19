Factory.sequence( :string ) do |n|
  "abc#{n}"
end

Factory.sequence( :email ) do |n|
  "test#{n}@example.com"
end
