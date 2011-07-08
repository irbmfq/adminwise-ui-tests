# load File.dirname(__FILE__) + '/maybe_your_template_page.rb'

class MemberSearchPage < AbstractPage

  def initialize(browser)
    super(browser, "") # <= 
  end

  def enter_name(member_name)
    @driver.find_element(:name, "member_name").send_keys(member_name)
  end

end
