require_relative '../spec_helper'
require_relative '../pages/login_page'
require_relative '../pages/admin_page'

describe 'OrangeHRM Admin UI', type: :feature do
  let(:login_page) { LoginPage.new }
  let(:admin_page) { AdminPage.new }

  before do
    login_page.visit_page
    login_page.login('Admin','admin123')
    expect(login_page.logged_in?).to be(true)
    admin_page.navigate_to_add_user
  end

  it 'adds a new user successfully' do
    username = "user_#{Time.now.to_i}_#{rand(1000)}"

    admin_page.fill_user_form(
      user_role: 'Admin',
      employee_name: 'test',
      status: 'Enabled',
      username: username,
      password: 'John1234',
      confirm_password: 'John1234'
    )
    admin_page.save_user

    expect(admin_page.user_saved?).to be(true)
  end

  it 'shows validation errors with empty fields' do
    admin_page.save_user
    expect(admin_page.empty_field_error_visible?).to be(true)
  end

  it 'finds the user after adding it' do
    username = "user_#{Time.now.to_i}_#{rand(1000)}"

    admin_page.fill_user_form(
      user_role: 'Admin',
      employee_name: 'test',
      status: 'Enabled',
      username: username,
      password: 'John1234',
      confirm_password: 'John1234'
    )
    admin_page.save_user
    expect(admin_page.user_saved?).to be(true)

    admin_page.search_user(username)
    expect(admin_page.user_found?).to be(true)
  end
end
