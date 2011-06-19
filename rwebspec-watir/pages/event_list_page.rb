# load File.dirname(__FILE__) + '/maybe_your_template_page.rb'

class EventListPage < RWebSpec::AbstractWebPage

  def initialize(browser)
    super(browser, "Listing events") # <= 
  end

  def edit(index)
    click_link_with_id("edit_#{index}")
    expect_page EventPage 
  end
  
  def click_new
    click_link("New event")
    expect_page EventPage 
  end
end
