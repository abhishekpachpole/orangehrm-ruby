require_relative '../spec_helper'
require_relative '../pages/login_page'
require_relative '../pages/pim_page'

describe 'OrangeHRM PIM UI', type: :feature do
  let(:login_page) { LoginPage.new }
  let(:pim_page) { PimPage.new }

  before do
    login_page.visit_page
    login_page.login('Admin','admin123')
    expect(login_page.logged_in?).to be(true)
    pim_page.navigate_to_add_employee
  end

  it 'adds a new employee successfully' do
    first_name = "first#{Time.now.to_i}"
    last_name = "last#{Time.now.to_i}"

    pim_page.fill_employee_form(first_name: first_name, last_name: last_name)
    pim_page.save_employee

    expect(pim_page.employee_saved?).to be(true)
  end

  it 'shows validation errors with an empty employee form' do
    pim_page.save_employee
    expect(pim_page.empty_field_error_visible?).to be(true)
  end
end
