class AdminPage
  include Capybara::DSL

  EMPLOYEE_NAME = 'input[placeholder="Type for hints..."]'
  USERNAME = 'input.oxd-input'
  PASSWORD = 'input[type="password"]'
  SELECT_TEXT = '.oxd-select-text'
  SUBMIT = '[type="submit"]'
  INPUT_ERROR = '.oxd-input-field-error-message'
  SEARCH_RESULTS = '.oxd-table-card'

  def navigate_to_add_user
    visit '/web/index.php/admin/saveSystemUser'
  end

  def navigate_to_search_user
    visit '/web/index.php/admin/viewSystemUsers'
  end

  def fill_user_form(user_role:, employee_name:, status:, username:, password:, confirm_password:)
    all(SELECT_TEXT)[0].click
    find('[role="option"]', text: user_role, exact_text: true).click

    find(EMPLOYEE_NAME).fill_in(with: employee_name)
    first('[role="option"]', text: employee_name).click

    all(SELECT_TEXT)[1].click
    find('[role="option"]', text: status, exact_text: true).click

    all(USERNAME)[1].fill_in(with: username)
    all(PASSWORD)[0].fill_in(with: password)
    all(PASSWORD)[1].fill_in(with: confirm_password)
  end

  def save_user
    find(SUBMIT, match: :first).click
  end

  def user_saved?
    has_current_path?(%r{/web/index.php/admin/viewSystemUsers}, wait: 10)
  end

  def empty_field_error_visible?
    has_css?(INPUT_ERROR, wait: 5)
  end

  def search_user(username)
    all(USERNAME)[1].fill_in(with: username)
    find(SUBMIT, match: :first).click
  end

  def user_found?
    has_css?(SEARCH_RESULTS, wait: 10)
  end
end
