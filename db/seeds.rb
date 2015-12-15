# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

#####################################
#
# FOR ALL ENVIRONMENT
#
#####################################

# Clean Database (Only dev)
if Rails.env.development?
  DatabaseCleaner.clean_with :truncation
end


# Create Admin User
User.create({first_name: 'Administrator', last_name: 'FH', email: 'admin@technikum-wien.at', password: '12345678',
             password_confirmation: '12345678', admin: true})

# Create sample users
1.upto(50) do |i|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  User.create({first_name: first_name, last_name: last_name,
               email: first_name + '.' + last_name + (i * 53).to_s + '@technikum-wien.at', password: '12345678',
               password_confirmation: '12345678', admin: false})
end


# Create Cloud Service Types
CloudServiceType.create({name: 'Infrastructure as a Service (IaaS)'})
CloudServiceType.create({name: 'Platform as a Service (PaaS)'})
CloudServiceType.create({name: 'Software as a Service (SaaS)'})


# Create OS
OperatingSystem.create({name: 'Windows'})
OperatingSystem.create({name: 'Linux'})
OperatingSystem.create({name: 'OS X Server'})


# Create PaaS Categories (these are just language strings, translated with I18n)
PaasCategory.create({name: 'monitoring_and_alerting'})
PaasCategory.create({name: 'operation_and_deployment'})
PaasCategory.create({name: 'scaling'})
PaasCategory.create({name: 'apis_and_devtools'})
PaasCategory.create({name: 'standards_and_transferability'})
PaasCategory.create({name: 'security'})


# Create SaaS Categories (these are just language strings, translated with I18n)
SaasCategory.create({name: 'collaboration'})
SaasCategory.create({name: 'crm'})
SaasCategory.create({name: 'erp'})
SaasCategory.create({name: 'accounting'})
SaasCategory.create({name: 'pm'})
SaasCategory.create({name: 'email_marketing'})
SaasCategory.create({name: 'web_hosting_ecommerce'})
SaasCategory.create({name: 'hr'})



#####################################
#
# ONLY FOR DEVELOPMENT ENVIRONMENT
#
#####################################
if Rails.env.development?

  # Create Test User
  User.create({first_name: 'Test', last_name: 'User', email: 'test@technikum-wien.at', password: '12345678',
               password_confirmation: '12345678', admin: false})


  # Create Cloud Services (IaaS)
  1.upto(30) do |i|
    object = CloudService.create({title: Faker::Company.catch_phrase, short_description: Faker::Lorem.sentence,
                                  long_description: Faker::Lorem.paragraph(25), price: Faker::Number.decimal(2),
                                  provider_url: Faker::Internet.url, active: rand(0..1), user_id: 1,
                                  cloud_service_type_id: 1})

    IaasAttribute.create({ram: Faker::Number.between(512, 16384), cpu: Faker::Number.between(1, 4),
                          storage: Faker::Number.between(1024, 50000), bandwidth: Faker::Number.between(20, 1024),
                          cloud_service_id: object.id, operating_system_id: rand(1..3)})
  end


  # Create Cloud Services (PaaS)
  1.upto(30) do |i|
    object = CloudService.new({title: Faker::Lorem.sentence, short_description: Faker::Lorem.sentence,
                               long_description: Faker::Lorem.paragraph, price: Faker::Number.decimal(2),
                               provider_url: Faker::Internet.url, active: rand(0..1), user_id: 1,
                               cloud_service_type_id: 2})

    object.paas_category_ids = (1..6).to_a.sample(rand(1..6))
    object.save!
  end


  # Create Cloud Services (SaaS)
  1.upto(30) do |i|
    object = CloudService.new({title: Faker::Lorem.sentence, short_description: Faker::Lorem.sentence,
                               long_description: Faker::Lorem.paragraph, price: Faker::Number.decimal(2),
                               provider_url: Faker::Internet.url, active: rand(0..1), user_id: 1,
                               cloud_service_type_id: 3})

    object.saas_category_ids = (1..8).to_a.sample(rand(1..8))
    object.save!
  end

end


