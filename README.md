# GeizCloud

## Used versions
- Ruby 2.2.0
- Rails 4.2.5

## Information, Tutorials and more
- [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#links)
- [Rails Assets](http://rails-assets.org) (for application dependencies, ex. Bootstrap)

## Project Status
### ToDos
* Check E-Mail for ...@technikum-wien.at
* Translate devise error messages

### Completed
* Registration: min. 8 characters delete or refactor

## Installation
1. Pull/Clone repository
2. Run `bundle install` to install missing dependencies
3. Run `bundle exec figaro install` to create missing file for environment variables. Add the following to config/application.yml:
    - SECRET_KEY_BASE: xxx
    - MYSQL_DEV_PASSWORD: xxx
    - MYSQL_PRD_PASSWORD: xxx