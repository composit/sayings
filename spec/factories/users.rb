Factory.define :user do |f|
  f.username { Factory.next( :string ) }
  f.email { Factory.next( :email ) }
  f.password "password"
  f.password_confirmation "password"
end
