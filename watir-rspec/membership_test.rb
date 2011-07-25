load File.dirname(__FILE__) + '/test_helper.rb'

describe "Memebership" do
  include TestHelper

  before(:all) do
    @browser = Watir::Browser.new
    reset_database
    logout
    login_as("admin", "test")
  end

  after(:all) do
    logout unless debugging?
    @browser.close unless debugging?
  end

  before(:each) do
    visit "/home"
  end

  it "Admin user can search an existing member by surname " do
    @browser.text_field(:name, "search").set "Smith"
    @browser.button(:value, "Search").click
    @browser.text.should include("David Smith")
  end
  
  it "Admin user can search an existing member by membership number" do
    @browser.text_field(:name, "search").set "30002"
    @browser.button(:value, "Search").click
    assert_link_present_with_text("David Smith")
  end
  
  it "[493] Admin user can create a new family member" do
    @browser.link(:text,"Membership").click
    membership_page =  MembershipPage.new(@browser)
    membership_page.add_member
    membership_page.enter_first_name("Cindy")
    membership_page.enter_last_name("Fu")
    membership_page.enter_street_address("25 John Drive")
    membership_page.enter_suburb("Ashgrove")
    membership_page.enter_state("QLD")
    membership_page.enter_postcode("4051")
    membership_page.enter_phone("33440566")
    membership_page.enter_mobile("0411231764")
    membership_page.enter_email("cindy@agileway.com.au")
    membership_page.click_member_type("family_1")
    membership_page.click_mail_out("true")
    membership_page.click_doing_aba("true")
    membership_page.select_aware_from("family/ friend")
    membership_page.click_create_member
    membership_page.click_membership
    @browser.text.should include("Cindy Fu")
  end

  it "[494] Admin user can create a new organisation member" do
    membership_page = MembershipPage.new(@browser)
    membership_page.click_add_member
    membership_page.enter_organisation_name("CareLink Pty Ltd")
    membership_page.enter_first_name("Michele")
    membership_page.enter_last_name("Wind")
    membership_page.enter_street_address("36 Steven Road")
    membership_page.enter_suburb("Stafford")
    membership_page.enter_state("QLD")
    membership_page.enter_postcode("4054")
    membership_page.enter_phone("3972 5844")
    membership_page.enter_email("mwind@carelink.com.au")
    membership_page.click_member_type("school")
    membership_page.select_aware_from("conference/ workshop")
    membership_page.click_create_member
    membership_page.click_membership
    @browser.text.should include("CareLink Pty Ltd")
  end

end






