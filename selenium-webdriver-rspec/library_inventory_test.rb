load File.dirname(__FILE__) + '/test_helper.rb'

specification "Library: Add resourses" do
  include TestHelper

  before(:all) do
    @driver = Selenium::WebDriver.for(:ie) 
    @driver.navigate.to($ITEST2_PROJECT_BASE_URL || $BASE_URL)
    reset_database
    fail_safe{ logout }
    login_as("admin")
  end

  after(:all) do
    fail_safe{ logout }
    @driver.quit unless debugging?
  end

  before(:each) do
    visit "/home"
    @driver.find_element(:link_text, "LIBRARY").click
  end

  after(:each) do    
    goto_page("/home") unless debugging?
  end

  story "[489] Admin user can add a new library resource manually" do
    library_page = LibraryPage.new(@driver)
    library_page.add_new_resources
    library_page.add_manually
    new_resource_page = NewResourcePage.new(@driver)
    new_resource_page.enter_title("The Other Country")
    new_resource_page.enter_authors("Michael Whelan")
    new_resource_page.select_subject("Families")
    new_resource_page.click_create
    click_button("Save")
    @driver.find_element(:link_text, "Library").click
    @driver.find_element(:name, "q").send_keys "The Other Country"
    click_button("search")
    try { @driver.page_source.should include("matches for 'The Other Country'")}
  end

=begin
  story"[490] Admin user can add new resource via amazon"do
    library_page = LibraryPage.new(@driver)
    library_page.add_new_resources
    if page_text.include?("OR")
      enter_text("q", "Web Test Automation")
      click_button("search")
      try(10) {    link(:text => "Add", :index => 1).click }
      click_button("Create")
      click_button("Save")
      @driver.find_element(:link_text, "Library").click
      enter_text("q", "Unit Testing")
      click_button("search")
      try { @driver.page_source.should include("Pragmatic Unit Testing in Java with JUnit")}
    else
      puts "Amazon ECS is not installed or configured, amazon search test ignored"
    end
  end
=end

end
