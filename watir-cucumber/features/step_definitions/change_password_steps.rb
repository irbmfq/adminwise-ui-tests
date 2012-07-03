

Given /^I login as "(.*?)" and on Password Change Page$/ do |username|
  begin;  logout; rescue => e; end
  @browser.goto($BASE_URL)
  home_page = HomePage.new(@browser)
  home_page.enter_login(username)
  home_page.enter_password("test")
  home_page.click_login

  @browser.link(:id, "user_nav_link").click
  sleep 0.5
  @browser.link(:id, "profile_link").click

  @browser.link(:text, "Change password").click        
  @password_change_page = PasswordChangePage.new(@browser)
  # @password_change_page = Object.const_get(page_name.gsub(" ","")).new(@browser)
end

When /^I enter current password "(.*?)"$/ do |pass|
  @password_change_page.enter_current pass
end

When /^enter new password "(.*?)"$/ do |new_pass|
  @password_change_page.enter_new  new_pass  
end

When /^enter confirmation "(.*?)"$/ do |confirm_password|
  @password_change_page.enter_confirm(confirm_password)
end

When /^I click change$/ do
  @browser.button(:value, "Change").click
end

Then /^I should get error "(.*?)"$/ do |message|
  assert @browser.text.include?(message)
end

Then /^I can relogin as "(.*?)" with new password "(.*?)"$/ do |username, new_pass|
  logout
  home_page = HomePage.new(@browser)
  home_page.enter_login(username)
  home_page.enter_password(new_pass)
  home_page.click_login
  @browser.link(:id, "user_nav_link").click;
  sleep 0.5
  @browser.link(:id, "profile_link").click;
end

def logout
  @browser.link(:id, "user_nav_link").click;
  sleep 0.5
  @browser.link(:id, "sign_out_link").click;
end
