# THIS PROJECT IS NOT MAINTAINED ANYMORE!!!

# GeizCloud

## What is it?
University project: Web based application (Ruby on Rails) to find and compare Cloud Services from different providers.

### Features
* Register/Login
* Search Cloud Services (attribute based search)
* Cloud Service Comparison
* Administration of Cloud Services (Add, Update, Release, Activate/Deactivate)
* Administration of Users (Create, Update, Activate/Deactivate)
* REST API for Cloud providers

## Dependencies
- Ruby >= 2.2.0 (Tip: use [Ruby Version Manager](https://rvm.io) to manage Ruby versions)
- MySQL >= 5.7

## Installation
1. Clone repository
2. Go to project root
2. Run `$ bundle install` to install missing dependencies
3. Run `$ bundle exec figaro install` to create missing file for environment variables. Add the following to config/application.yml:
    - SECRET_KEY_BASE:      xxx (use `$ rake secret` to generate key)
    - MYSQL_DEV_USER:       xxx
    - MYSQL_DEV_PASSWORD:   xxx
    - MYSQL_PRD_USER:       xxx
    - MYSQL_PRD_PASSWORD:   xxx
    - GMAIL_DEV_USERNAME:   xxx
    - GMAIL_DEV_PASSWORD:   xxx
    - GMAIL_PRD_USERNAME:   xxx
    - GMAIL_PRD_PASSWORD:   xxx
4. Run `$ rake db:create` (creates database)
5. Run `$ rake db:schema:load` (loads schema)
6. Run `$ rake db:seed:default` (create necessary data)
7. Optional: Run `$ rake db:seed:sample:data` (create sample data)
8. Optional: Run `$ yardoc` to generate API documentation
9. Optional: Run `$ yardoc server` to to host documentation

## Information, Tutorials and more
* [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#links)
* For detailed information about used gems take a look at the Gemfile
* [Rails Assets](http://rails-assets.org) (for frontend application dependencies, ex. Bootstrap)
* [Rails Services for Business Logic](http://adamniedzielski.github.io/blog/2014/11/25/my-take-on-services-in-rails/)
* [Frontend Framework - INSPINIA (based on Bootstrap 3)](http://wrapbootstrap.com/preview/WB0R5L90S)

## License
[MIT](LICENSE.md)
