class CreateUserPage < AbstractPage

  def initialize(driver)
    super(driver, "Register")
  end

  def enter_username(username)
    browser.text_field(:name, "user[username]").set username
  end

  def enter_email(email)
    browser.text_field(:name, "user[email]").set email
  end

  def enter_password(password)
    browser.text_field(:name, "user[password]").set password
  end

  def click_create
    browser.button(:value, "Create User").click
  end
end
