Factory.define :user do |user|
  user.name 'Alice'
  user.email 'alice@wonderland.com'
  user.password 'foobar'
  user.password_confirmation 'foobar'
end

Factory.sequence :email do |n|
  "email-#{n}@example.com"
end

Factory.define :micropost do |micropost|
  micropost.content 'Foo bar'
  micropost.association :user
end