TEST_DATA_DIR = "./features/test_data"

require 'rubygems'
require 'watir'

require File.join(File.dirname(__FILE__), "..","..", "pages", "abstract_page.rb")
Dir["#{File.dirname(__FILE__)}/../../pages/*_page.rb"].each { |file| load file }

browser = Watir::Browser.new
# browser.goto("http://10.0.0.6:3000")
#browser.goto("http://adminwise.agileway.net")

Before do
  @browser = browser
  reset_database  
end

After do |scenario|
  if scenario.failed?
    puts "Scenario failed: #{scenario.inspect} | #{scenario.exception.message}"
  end
end

at_exit do
  browser.close if browser
end

# Helper methods 
def reset_database
  base_url = $ITEST2_PROJECT_BASE_URL || $BASE_URL
  @browser.goto("#{base_url}/reset")
  @browser.goto("#{base_url}/")
end
