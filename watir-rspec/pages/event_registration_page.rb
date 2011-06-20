# load File.dirname(__FILE__) + '/maybe_your_template_page.rb'

class EventRegistrationPage < AbstractPage

  def initialize(browser)
    super(browser, "") # <= 
  end

  def enter_member_id(member_id)
    @driver.text_field(:name, "member_id").set member_id
  end

  def enter_member_surname(member_surname)
    @driver.text_field(:name, "member_surname").set member_surname
  end
  
  def click_find
    click_button("Find")
  end
  
  def click_register
    @driver.button(:id, "registerBtn").click
  end

  def select_is_member(is_member)
    click_radio_option("is_member", is_member)
  end
  
  # function(parameter))
  def enter_person_title(person_title)
    @browser.text_field(:name, "person[title]").set person_title
  end
  
  def enter_first_name(person_first_name)
    @browser.text_field(:name, "person[first_name]").set person_first_name
  end
  
  def enter_last_name(person_last_name)
    @browser.text_field(:name, "person[last_name]").set person_last_name
  end
  
  def enter_organisation(person_organisation)
    @browser.text_field(:name, "person[organisation]").set person_organisation
  end
  
  def select_person_occupation(person_occupation)
      select_option("person[occupation]", person_occupation)
  end
  
  def enter_person_email(person_email)
    @browser.text_field(:name, "person[email]").set person_email
  end
  
  def enter_person_phone(person_phone)
    @browser.text_field(:name, "person[phone]").set person_phone
  end
  
  def enter_address_line1(person_address_line1)
    @browser.text_field(:name, "person[address_line1]").set address_line1
  end
  
  def enter_person_suburb(person_suburb)
    @browser.text_field(:name, "person[suburb]").set person_suburb
  end
  
  def enter_postcode(person_postcode)
    @browser.text_field(:name, "person[postcode]").set person_postcode
  end
  
  def uncheck_checkbox_email_notification
      uncheck_checkbox("event_registration[email_notification]", "1")
  end
  
  def uncheck_event_registration_emal_notification
      uncheck_checkbox("event_registration[email_notification]", "1")
  end
  
  def click_register
    @browser.button(:id, "registerBtn").click
  end
  
  def uncheck_checkbox_registration_email_notificaton
      uncheck_checkbox("event_registration[email_notification]", "1")
  end

  def click_confirm
      click_button("Confirm")
  end

end
