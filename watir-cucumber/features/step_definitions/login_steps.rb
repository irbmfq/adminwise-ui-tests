# begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end

Given /^I am on Home Page$/ do
  begin
    @browser.link(:id, "user_nav_link").click;
    sleep 0.5
    @browser.link(:id, "sign_out_link").click;
  rescue => e
  end
  @browser.goto($BASE_URL)
  @home_page = HomePage.new(@browser)
end

Given /^I have entered password (\w+) on login page$/ do |password|
@home_page.enter_password(password)
end

Given /^I have entered userame (\w+) on login page$/ do |username|
@home_page.enter_login(username)
end

When /^I press '([^"]*)' button$/ do |button_name|
  if button_name == 'Sign In'
    @home_page.click_login
  end
end

Then /^the text (.*) should be on the screen$/ do |message|
  # @browser.text.include?(message).should be_true
  assert(@browser.text.include?(message))
end
