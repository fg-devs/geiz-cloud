# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

# Get the version number from GIT and save it as a CONSTANT, accessible in views via <%= APP_VERSION %>
APP_VERSION = `git describe --tags --always` unless defined? APP_VERSION
