# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Campusbooks::Application.initialize!

Rubaidh::GoogleAnalytics.tracker_id = 'UA-37200107-1'
