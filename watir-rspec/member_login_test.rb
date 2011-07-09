load File.dirname(__FILE__) + '/test_helper.rb'

describe "Memeber Login" do
  include TestHelper

  before(:all) do
    @driver = Watir::Browser.new
    reset_database
    logout
    login_as("admin", "test")
  end

  after(:all) do
    logout unless debugging?
    @driver.close unless debugging?
  end

  before(:each) do
    visit "/home"
  end

  it "[495] Admin can generate a login for an existing member" do
    @driver.link(:text,"Membership").click
    @driver.link(:text,"David Smith").click
    @driver.button(:value, "Generate login").click
    sleep 1
    @driver.link(:text,"dsmith").click # click new link to member login
    assert_link_present_with_text("David Smith")

    @driver.link(:text,"Member logins").click
    @driver.text_field(:name, "search").set "dsmith"
    @driver.button(:value, "Search").click
    assert_link_present_with_text("dsmith")
  end

end






