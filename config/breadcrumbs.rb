crumb :root do
  link I18n.t('breadcrumbs.home'), root_path
end

# Search cloud services
crumb :cloud_services do
  link I18n.t('breadcrumbs.cloud_services')
  parent :root
end

# Edit profile
crumb :edit_profile do
  link I18n.t('breadcrumbs.edit_profile')
  parent :root
end




# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).