
class MembershipPage < AbstractPage

  def initialize(driver)
    super(driver, "") # <= TEXT UNIQUE TO THIS PAGE
  end

  def add_member
    browser.find_element(:link_text, "Add member").click
  end

  def click_add_member
    browser.find_element(:link_text, "Add member").click
  end
  
  def enter_first_name(member_fname)
    browser.find_element(:name, "member[fname]").send_keys(member_fname)
  end

  def enter_last_name(member_lname)
    browser.find_element(:name, "member[lname]").send_keys(member_lname)
  end

  def enter_street_address(member_street_addr)
    browser.find_element(:name, "member[street_addr]").send_keys(member_street_addr)
  end

  def enter_suburb(member_suburb)
    browser.find_element(:name, "member[suburb]").send_keys(member_suburb)
  end

  def enter_state(member_state)
    browser.find_element(:name, "member[state]").send_keys(member_state)
  end

  def enter_postcode(member_postcode)
    browser.find_element(:name, "member[postcode]").send_keys(member_postcode)
  end

  def enter_phone(member_phone)
    browser.find_element(:name, "member[phone]").send_keys(member_phone)
  end

  def enter_mobile(member_mobile)
    browser.find_element(:name, "member[mobile]").send_keys(member_mobile)
  end

  def enter_email(member_email)
    browser.find_element(:name, "member[email]").send_keys(member_email)
  end

  def click_member_type(member_type)
    radio_group =  "member[member_type]"
    radio_option = member_type
    browser.find_element(:xpath, "//input[@type='radio' and @name='#{radio_group}' and @value='#{radio_option}']").click
  end

  def click_mail_out(member_mail_out)
    radio_group =  "member[mail_out]"
    radio_option = member_mail_out
    browser.find_element(:xpath, "//input[@type='radio' and @name='#{radio_group}' and @value='#{radio_option}']").click
  end

  def click_doing_aba(member_doing_aba)
    radio_group =  "member[doing_aba]"
    radio_option = member_doing_aba
    browser.find_element(:xpath, "//input[@type='radio' and @name='#{radio_group}' and @value='#{radio_option}']").click
  end

  def select_aware_from(member_aware_from)
    browser.find_element(:name, "member[aware_from]").send_keys(member_aware_from)
    #    select_option("member[aware_from]", member_aware_from)
  end

  def click_create_member
    browser.find_element(:id, "member_submit").click
    # click_button("Create Member")
  end

  def click_membership
    browser.find_element(:link_text, "MEMBERSHIP").click
  end

  def enter_organisation_name(member_oname)
    browser.find_element(:name, "member[oname]").send_keys(member_oname)
  end

  def enter_first_name(member_fname)
    browser.find_element(:name, "member[fname]").send_keys(member_fname)
  end
end
