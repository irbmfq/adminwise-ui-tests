load File.dirname(__FILE__) + '/test_helper.rb'

test_suite "Event Registrations as Admin" do
  include TestHelper

  before(:all) do
    open_browser
    reset_database
    failsafe{ logout }
    login_as("bob")
  end

  before(:each) do
    visit "/home"
    click_link("Events")
    event_list_page = expect_page EventListPage
    click_link("Wise Testing Conference")
  end

  after(:each) do
    fail_safe { logout } unless debugging?
  end

  after(:all) do
    close_browser unless debugging?
  end

  test "[483] Admin User can register on behalf someone" do
    click_link("Register on applicant's behalf")
    event_registration_page = expect_page EventRegistrationPage
    event_registration_page.select_is_member("yes")
    try(3) { event_registration_page.enter_member_id("30002") }
    event_registration_page.enter_member_surname("Smith")
    event_registration_page.click_find
    sleep 1
    event_registration_page.click_register
    page_text.should contain("Address line1 can't be blank")
    enter_text("person[address_line1]", "10 Pember St")
    event_registration_page.click_register

    click_button("Confirm")
    page_text.should include("Your registration for Wise Testing Conference has been received")
  end

#  test "Admin user can register a staff " do
#    click_link("Register staff")
#  end


end
