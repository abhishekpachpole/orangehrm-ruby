require_relative '../spec_helper'
require_relative '../pages/login_page'

describe 'OrangeHRM Login UI', type: :feature do
  let(:login_page) { LoginPage.new }

  before do
    login_page.visit_page
  end

  it 'logs in with valid credentials' do
    login_page.login('Admin','admin123')
    expect(login_page.logged_in?).to be(true)
  end

  it 'shows an error with invalid credentials' do
    login_page.login('test', 'test')
    expect(login_page.invalid_credentials_error_visible?).to be(true)
  end

  it 'shows validation errors with empty fields' do
    login_page.login('', '')
    expect(login_page.empty_field_error_visible?).to be(true)
  end
end
