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


# Create Cloud Service Attribute Weighting
CsAttributeWeighting.create({ram: 0.4, cpu: 0.2, storage: 0.3, bandwidth: 0.1})


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
