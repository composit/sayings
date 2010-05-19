Factory.define :user do |f|
  f.login { Factory.next( :string ) }
  f.email { Factory.next( :email ) }
  f.password "password"
  f.password_confirmation "password"
end
