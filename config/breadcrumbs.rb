crumb :root do
  link I18n.t('breadcrumbs.home'), cloud_services_path
end

# Search cloud services
crumb :search_cloud_services do
  link I18n.t('breadcrumbs.search_cloud_services'), cloud_services_path
  parent :root
end

# Detail for cloud services
crumb :detail_cloud_service do
  link I18n.t('breadcrumbs.detail_cloud_service')
  parent :search_cloud_services
end

# Product comparison
crumb :product_comparison do
  link I18n.t('breadcrumbs.product_comparison')
  parent :root
end

# Administration (Admin)
crumb :administration do
  link I18n.t('breadcrumbs.administration')
  parent :root
end

# Display Cloud Services (Admin)
crumb :cloud_service_administration do
  link I18n.t('breadcrumbs.cloud_service_administration'), admin_cloud_services_path
  parent :administration
end

# Release Cloud Services (Admin)
crumb :release_cloud_services do
  link I18n.t('breadcrumbs.release_cloud_services'), release_admin_cloud_services_path
  parent :administration
end

# Create Cloud Service (Admin)
crumb :create_cloud_service do
  link I18n.t('breadcrumbs.create_cloud_service'), new_admin_cloud_service_path
  parent :cloud_service_administration
end

# Edit Cloud Service (Admin)
crumb :edit_cloud_service do
  link I18n.t('breadcrumbs.edit_cloud_service'), edit_admin_cloud_service_path
  parent :cloud_service_administration
end

# User administration (Admin)
crumb :user_administration do
  link I18n.t('breadcrumbs.user_administration')
  parent :administration
end

# Administrate registered users (Admin)
crumb :registered_user_administration do
  link I18n.t('breadcrumbs.registered_user_administration'), admin_users_path
  parent :user_administration
end

# Administrate API users (Admin)
crumb :api_user_administration do
  link I18n.t('breadcrumbs.api_user_administration'), api_admin_users_path
  parent :user_administration
end

# Administrate specific user (Admin)
crumb :administrate_user do
  link I18n.t('breadcrumbs.edit_user')
  parent :registered_user_administration
end

# Edit profile
crumb :edit_profile do
  link I18n.t('breadcrumbs.edit_profile')
  parent :root
end