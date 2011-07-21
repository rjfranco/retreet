require 'faker'

namespace :db do  
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    User.create!(:name => 'Example user', :email => 'example@example.com', :password => 'foobar', :password_confirmation => 'foobar')
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@example.com"
      password = 'foobar'
      User.create!(:name => name, :email => email, :password => password, :password_confirmation => password )
    end
  end
end