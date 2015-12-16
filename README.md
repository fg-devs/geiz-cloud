# GeizCloud

## What is it?
Web based application to find and compare Cloud Services from different providers.

### Features
* Search Cloud Services (attribute based search)
* Add Cloud Services to product comparison
* Administration of Cloud Services (Add, Update, Release, Activate/Deactivate)
* Administration of registered users (Update, Activate/Deactivate)
* Register/Login
* REST API for Cloud providers

## Dependencies
- Ruby >= 2.2.0 (Tip: use [Ruby Version Manager](https://rvm.io) to manage Ruby versions)
- MySQL >= 5.7

## Installation
1. Clone repository
2. Go to project root
2. Run `$ bundle install` to install missing dependencies
3. Run `$ bundle exec figaro install` to create missing file for environment variables. Add the following to config/application.yml:
    - SECRET_KEY_BASE: xxx (use `$ rake secret` to generate key)
    - MYSQL_DEV_USER: xxx
    - MYSQL_DEV_PASSWORD: xxx
    - MYSQL_PRD_USER: xxx
    - MYSQL_PRD_PASSWORD: xxx
4. Run `$ rake db:schema:load` (database must exist)
5. Run `$ rake db:seed`

## Information, Tutorials and more
* [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#links)
* For detailed information about used gems, please refer to Gemfile
* [Rails Assets](http://rails-assets.org) (for frontend application dependencies, ex. Bootstrap)
* [Rails Services for Business Logic](http://adamniedzielski.github.io/blog/2014/11/25/my-take-on-services-in-rails/) (Why using service layer?)
* [Frontend Framework - INSPINIA (based on Bootstrap3)](http://wrapbootstrap.com/preview/WB0R5L90S)

## Project Status
### Pending
* GENERAL: Authorization - Check in controllers and in HTML, display links only to authorized users
* CLOUD_SERVICES: Release Cloud Cervices created by Cloud Service Providers (REST API)
* REST_API: Create REST API for Cloud Service Providers
* GENERAL: Pagination - retain page number after updating or changing status of record

### In Progress

### Completed
* Registration: min. 8 characters delete or refactor
* REGISTRATION: Check E-Mail for ...@technikum-wien.at
* DEVISE: Translate devise error messages
* USER/SESSION_MGMT: Logout
* USER/SESSION_MGMT: Edit profile
* USER/SESSION_MGMT: Show users as admin
* USER/SESSION_MGMT: Update users as admin
* CLOUD_SERVICES: Create Cloud Services as admin
* CLOUD_SERVICES: Show Cloud Services as admin
* CLOUD_SERVICES: Update Cloud Services as admin
* GENERAL: Add Turbolinks loader for better usability
* GENERAL: UserService GetAll Remove ::
* GENERAL: Refactor helpers --> do not pass parameter, use instance variable instead (if its not called in a loop)
* JAVASCRIPT: Refactor Javascripts
* DB_SEED: Create seeds for SaaS categories
* JAVASCRIPT: Refactored JS to CoffeeScript
* FIX: missing translation on registration, if email is already taken
* CLOUD_SERVICES: Show Cloud Services with filters
* CLOUD_SERVICES: Show Cloud Services detail
* BUG: Create cloud service layout bug
* GENERAL: Search box increase col size
* GENERAL: Add active_link_to in navigation to mark current visited links
* CLOUD_SERVICES: Add Cloud Services to product comparison
* CLOUD_SERVICES: Remove Cloud Services from product comparison