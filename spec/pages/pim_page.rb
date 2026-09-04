class PimPage
  include Capybara::DSL

  FIRST_NAME = '[name="firstName"]'
  LAST_NAME = '[name="lastName"]'
  SUBMIT = '[type="submit"]'
  INPUT_ERROR = '.oxd-input-field-error-message'

  def navigate_to_add_employee
    visit '/web/index.php/pim/addEmployee'
  end

  def fill_employee_form(first_name:, last_name:)
    find(FIRST_NAME).fill_in(with: first_name)
    find(LAST_NAME).fill_in(with: last_name)
  end

  def save_employee
    find(SUBMIT, match: :first).click
  end

  def employee_saved?
    has_current_path?(%r{/web/index.php/pim/viewPersonalDetails/empNumber/\d+}, wait: 10)
  end

  def empty_field_error_visible?
    has_css?(INPUT_ERROR, wait: 5)
  end
end
