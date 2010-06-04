Factory.define( :user ) do |f|
  f.username { Factory.next( :string ) }
  f.email { Factory.next( :email ) }
  f.password "testpass"
  f.password_confirmation "testpass"
end
