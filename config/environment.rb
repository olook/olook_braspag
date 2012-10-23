# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
OlookBraspag::Application.initialize!
ENV["RACK_ENV"] ||= ENV["RAILS_ENV"]
