load File.dirname(__FILE__) + '/test_helper.rb'

test_suite "Events" do
  include TestHelper

  before(:all) do
    @driver = Watir::Browser.new
    reset_database
    logout
    login_as("admin")
  end

  before(:each) do
    visit "/"
    @driver.link(:text, "Events").click
  end

  after(:all) do
    logout unless debugging?
    @driver.close unless debugging?
  end

  # Press key Ctrl+Shift+T, then enter 123 quickly navigate you here
  story "[487] Can create a new event" do
    event_list_page = EventListPage.new(@driver)
    event_page = event_list_page.click_new
    event_page.enter_name("ABA Workshop")
    event_page.enter_venue("QUT")
    event_page.enter_presenters("Many")
    event_page.enter_date("10/12/2010")
    event_page.click_create
    @driver.text.should include("3 events")
  end

  test "[488] Can edit an existing event" do
    event_list_page =  EventListPage.new(@driver)
    event_page = event_list_page.edit(1)
    event_page.enter_name("2010 Agileway Testing Conference")
    event_page.click_update
    @driver.text.should include("2010 Agileway Testing Conference")
  end


end