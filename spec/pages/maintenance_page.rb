class MaintenancePage
  include Capybara::DSL

  PASSWORD = '[name="password"]'
  SUBMIT = '[type="submit"]'
  SEARCH_FIELD = 'input[placeholder="Type for hints..."]'

  def navigate
    visit '/web/index.php/maintenance/purgeEmployee'
  end

  def authenticate(password)
    find(PASSWORD).fill_in(with: password)
    find(SUBMIT, match: :first).click
  end

  def authenticated?
    !has_css?(PASSWORD, wait: 5)
  end

  def search_field_visible?
    has_css?(SEARCH_FIELD, wait: 5)
  end
end