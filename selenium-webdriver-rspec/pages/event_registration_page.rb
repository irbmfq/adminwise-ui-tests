# load File.dirname(__FILE__) + '/maybe_your_template_page.rb'

class EventRegistrationPage < AbstractPage

  def initialize(driver)
    super(driver, "") # <=
  end

  def enter_member_id(member_id)
    browser.find_element(:name, "member_id").send_keys(member_id)
  end
  
  def enter_member_surname(member_surname)
    browser.find_element(:name, "member_surname").send_keys(member_surname)
  end
  
  def click_find
    # click_button("Find")    
    browser.find_element(:name, "commit").click
  end

  def click_register
    browser.find_element(:id, "registerBtn").click
  end

  def select_is_member(is_member)    
    radio_buttons_with_same_name = browser.find_elements(:name, "is_member")
    if is_member && is_member.downcase == "yes" then
      radio_buttons_with_same_name[1].click
    else
      radio_buttons_with_same_name[0].click
    end
    # click_radio_option("is_member", is_member)
  end

  # function(parameter))
  def enter_person_title(person_title)
    browser.find_element(:name, "person[title]").send_keys person_title
  end

  def enter_first_name(person_first_name)
    browser.find_element(:name, "person[first_name]").send_keys person_first_name
  end

  def enter_last_name(person_last_name)
    browser.find_element(:name, "person[last_name]").send_keys person_last_name
  end

  def enter_organisation(person_organisation)
    browser.find_element(:name, "person[organisation]").send_keys person_organisation
  end

  def select_person_occupation(person_occupation)
    browser.find_element(:name, "person[occupation]").send_keys(person_occupation)
  end

  def enter_person_email(person_email)
    browser.find_element(:name, "person[email]").send_keys(person_email)
  end

  def enter_person_phone(person_phone)
    browser.find_element(:name, "person[phone]").send_keys(person_phone)
  end

  def enter_address_line1(person_address_line1)
    browser.find_element(:name, "person[address_line1]").send_keys(person_address_line1)
  end

  def enter_person_suburb(person_suburb)
    browser.find_element(:name, "person[suburb]").send_keys(person_suburb)
  end

  def enter_postcode(person_postcode)
    browser.find_element(:name, "person[postcode]").send_keys(person_postcode)
  end

  def uncheck_checkbox_email_notification
    uncheck_checkbox("event_registration[email_notification]", "1")
  end

  def uncheck_event_registration_emal_notification
    uncheck_checkbox("event_registration[email_notification]", "1")
  end

  def click_register
    browser.find_element(:id, "registerBtn").click
  end

  def uncheck_checkbox_registration_email_notificaton
    browser.find_element(:name, "event_registration[email_notification]").clear
  end

  def click_confirm
    click_button("Confirm")
  end

end
