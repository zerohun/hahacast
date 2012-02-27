# Load the rails application
require File.expand_path('../application', __FILE__)
FACEBOOK_KEYS = (YAML.load_file "#{Rails.root}/config/facebook.yml")[Rails.env]
TWITTER_KEYS = (YAML.load_file "#{Rails.root}/config/twitter.yml")[Rails.env]
# Initialize the rails application
Hahacast::Application.initialize!
