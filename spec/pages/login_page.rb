class LoginPage
  include Capybara::DSL

  USERNAME = '[name="username"]'
  PASSWORD = '[name="password"]'
  SUBMIT = '[type="submit"]'
  INVALID_CREDENTIAL_ERROR = '.oxd-alert-content-text'
  INPUT_ERROR = '.oxd-input-field-error-message'

  def visit_page
    visit '/'
  end

  def login(username, password)
    find(USERNAME).fill_in(with: username)
    find(PASSWORD).fill_in(with: password)
    find(SUBMIT, match: :first).click
  end

  def logged_in?
    has_current_path?(%r{/web/index.php/dashboard/index}, wait: 5)
  end

  def invalid_credentials_error_visible?
    has_css?(INVALID_CREDENTIAL_ERROR, wait: 5)
  end

  def empty_field_error_visible?
    has_css?(INPUT_ERROR, wait: 5)
  end
end
