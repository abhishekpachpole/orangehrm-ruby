require_relative '../spec_helper'
require_relative '../pages/login_page'
require_relative '../pages/maintenance_page'

describe 'OrangeHRM Maintenance UI', type: :feature do
  let(:login_page) { LoginPage.new }
  let(:maintenance_page) { MaintenancePage.new }

  before do
    login_page.visit_page
    login_page.login('Admin','admin123')
    expect(login_page.logged_in?).to be(true)
    maintenance_page.navigate
  end

  it 'authenticates and opens the purge employee form' do
    maintenance_page.authenticate('admin123')

    expect(maintenance_page.authenticated?).to be(true)
    expect(maintenance_page.search_field_visible?).to be(true)
  end
end
