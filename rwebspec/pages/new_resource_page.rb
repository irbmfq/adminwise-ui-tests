
class NewResourcePage < AbstractPage

  def initialize(browser)
    super(browser, "") # <= 
  end

  def select_subject(resource_subject)
    select_option("resource[subject]", resource_subject)
  end
  
  def click_create
    click_button("Create")
  end

  def enter_title(title)
    enter_text("resource[title]", title)
  end
  
  def enter_authors(resource_authors)
    enter_text("resource[authors]", resource_authors)
  end

end
