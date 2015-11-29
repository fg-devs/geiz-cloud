# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Create Admin User
# User.create({first_name: 'Administrator', last_name: 'Administrator', email: 'kuhbana@gmail.com', password: '12345678',
#              password_confirmation: '12345678', admin: true})


# Create sample users
1.upto(20) do |i|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  User.create({first_name: first_name, last_name: last_name,
               email: i.to_s + '_' + first_name + '.' + last_name + '@technikum-wien.at', password: '12345678',
               password_confirmation: '12345678', admin: false})
end