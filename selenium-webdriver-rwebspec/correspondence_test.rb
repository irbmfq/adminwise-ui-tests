load File.dirname(__FILE__) + '/test_helper.rb'

specification "Correspondence" do
  include TestHelper

  before(:all) do
    open_browser
    reset_database
    failsafe{ logout }
    login_as("bob")
  end
  
  before(:each) do
    click_link("Correspondences")
    click_link("New Correspondence")
    new_correspondence_page = expect_page NewCorrespondencePage
    new_correspondence_page.click_correspondence("Out")
    new_correspondence_page.enter_sender_receiver("Kelly Adell")
    new_correspondence_page.enter_description("Wrote a cover letter and post out the information booklet to Ashgrove State School Support Services")
    new_correspondence_page.click_create
  end
  
  after(:all) do
    close_browser unless debugging?
  end

  story "Can create a new correspondence" do
    page_text.should include("Ashgrove State School")
  end
  
  story "can edit existing correspondence" do
    click_link("Edit")
    enter_text("correspondence[description]", "Wrote a cover letter and post out the information booklet to Ashgrove West State School Support Services")
    click_button("Save")
    click_link("Edit")
    page_text.should include("Ashgrove West State School")
  end

end
