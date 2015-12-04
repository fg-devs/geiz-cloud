# GeizCloud

## Used versions
- Ruby 2.2.0 (Tip: use [Ruby Version Manager](https://rvm.io) to manage Ruby versions)
- Rails 4.2.5 (will be installed with Bundler automatically through Gemfile)

## Installation
1. Pull/Clone repository
2. Run `$ bundle install` to install missing dependencies
3. Run `$ bundle exec figaro install` to create missing file for environment variables. Add the following to config/application.yml:
    - SECRET_KEY_BASE: xxx
    - MYSQL_DEV_PASSWORD: xxx
    - MYSQL_PRD_PASSWORD: xxx

## Developing
### Git
* Use --no-ff option to merge branches (for example `$ git merge --no-ff feature-xxxx`)

## Information, Tutorials and more
- [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#links)
- For detailed information about used gems, please refer to /Gemfile
- [Rails Assets](http://rails-assets.org) (for application dependencies, ex. Bootstrap)
- [Rails Services for Business Logic](http://adamniedzielski.github.io/blog/2014/11/25/my-take-on-services-in-rails/) (Why using service layer?)
- [Frontend Framework - INSPINIA (based on Bootstrap3)](http://wrapbootstrap.com/preview/WB0R5L90S)

## Project Status
### ToDos
* GENERAL: Authorization - Check in controllers and in HTML to display links only to authorized users
* GENERAL: Add Turbolinks loader for better usability
* GENERAL: Add active_link_to in navigation to mark current visited links
* CLOUD_SERVICES: Show Cloud Services with filters
* CLOUD_SERVICES: Add Cloud Services to product comparison
* CLOUD_SERVICES: Remove Cloud Services from product comparison
* CLOUD_SERVICES: Show Cloud Services as admin
* CLOUD_SERVICES: Create Cloud Services as admin
* CLOUD_SERVICES: Update Cloud Services as admin
* REST_API: Create REST API for Cloud Service Providers

### Completed
* Registration: min. 8 characters delete or refactor
* REGISTRATION: Check E-Mail for ...@technikum-wien.at
* DEVISE: Translate devise error messages
* USER/SESSION_MGMT: Logout
* USER/SESSION_MGMT: Edit profile
* USER/SESSION_MGMT: Show users as admin
* USER/SESSION_MGMT: Update users as admin