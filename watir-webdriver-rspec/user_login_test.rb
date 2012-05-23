load File.dirname(__FILE__) + '/test_helper.rb'

describe "User Management" do
  include TestHelper

  before(:all) do
    @browser = Watir::Browser.new(browser_type)
    logout
    reset_database
  end

  after(:each) do
    logout unless debugging?
  end

  after(:all) do
    @browser.close unless debugging?
  end

  it "[480] A registered user can login" do
    login_as("bob", "test")
    assert_link_present_with_text("Logout")
  end

  it "[480] Admin user can login" do
    login_as("admin", "test")
    assert_link_present_with_text("Control Panel")
  end

  it "[480] Admin user can login - invalid password" do
    login_as("admin", "badpass")
    @browser.text.should include("Invalid email or password.")
  end

  it "[480] Admin user can login - try go the protected url" do
    visit "/events"
    sleep 1
    @browser.text.should include("You need to sign in or sign up before continuing.")
  end
  
end