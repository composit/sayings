Factory.define :user do |f|
  f.login "abc"
  f.email { Factory.next( :email ) }
  f.password "password"
  f.password_confirmation "password"
end
