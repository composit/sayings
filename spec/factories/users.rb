Factory.define :user do |f|
  f.login "abc"
  f.email "test@example.com"
  f.password "password"
  f.password_confirmation "password"
end
