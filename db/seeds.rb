# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Clean Database
DatabaseCleaner.clean_with :truncation


# Create Admin User
User.create({first_name: 'Administrator', last_name: 'FH', email: 'admin@technikum-wien.at', password: '12345678',
             password_confirmation: '12345678', admin: true})

# Create Test User
User.create({first_name: 'Test', last_name: 'User', email: 'test@technikum-wien.at', password: '12345678',
             password_confirmation: '12345678', admin: false})


# Create sample users
1.upto(50) do |i|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  User.create({first_name: first_name, last_name: last_name,
               email: i.to_s + '_' + first_name + '.' + last_name + '@technikum-wien.at', password: '12345678',
               password_confirmation: '12345678', admin: false})
end


# Create Cloud Service Types
CloudServiceType.create({name: 'IaaS'})
CloudServiceType.create({name: 'PaaS'})
CloudServiceType.create({name: 'SaaS'})


# Create OS
OperatingSystem.create({name: 'Windows'})
OperatingSystem.create({name: 'Linux'})
OperatingSystem.create({name: 'OS X Server'})


# Create PaaS Categories
PaasCategory.create({name: 'monitoring_and_alerting'})
PaasCategory.create({name: 'operation_and_deployment'})
PaasCategory.create({name: 'scaling'})
PaasCategory.create({name: 'apis_and_devtools'})
PaasCategory.create({name: 'standards_and_transferability'})
PaasCategory.create({name: 'security'})


# Create SaaS Categories
SaasCategory.create({name: 'collaboration'})
