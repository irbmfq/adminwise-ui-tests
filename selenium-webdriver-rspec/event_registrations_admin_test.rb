load File.dirname(__FILE__) + '/test_helper.rb'

test_suite "Event Registrations as Admin" do
  include TestHelper

  before(:all) do
    @driver = Selenium::WebDriver.for(:ie) 
    @driver.navigate.to($ITEST2_PROJECT_BASE_URL || $BASE_URL)
    reset_database
    fail_safe{ logout }
    login_as("admin")
  end

  before(:each) do
    visit "/home"
    @driver.find_element(:link_text, "Events").click
    event_list_page = EventListPage.new(@driver)
    @driver.find_element(:link_text, "ABIQ 2011 Autism Conference")
  end

  after(:each) do
    fail_safe { logout } unless debugging?
  end

  after(:all) do
    @driver.quit unless debugging?
  end

  test "[483] Admin User can register on behalf someone" do
    @driver.find_element(:link_text, "Register on applicant's behalf")
    event_registration_page = EventRegistrationPage.new(@driver)
    event_registration_page.select_is_member("yes")
    sleep 0.5
    event_registration_page.enter_member_id("30002")
    event_registration_page.enter_member_surname("Smith")
    event_registration_page.click_find
    sleep 1
    event_registration_page.click_register
    @driver.page_source.should include("Address line1 can't be blank")
    enter_text("person[address_line1]", "10 Pember St")
    event_registration_page.click_register

    click_button("Confirm")
    @driver.page_source.should include("Your registration for ABIQ 2011 Autism Conference has been received")
  end

#  test "Admin user can register a staff " do
#    @driver.find_element(:link_text, "Register staff")
#  end


end
