# OrangeHRM Ruby Automation

A UI test automation framework for OrangeHRM, built with Ruby, RSpec, and Capybara/Selenium WebDriver, using the Page Object Model pattern. Covers core user flows including login, Admin, PIM, and Maintenance.

This project contains OrangeHRM UI tests only.

## Requirements

* Ruby 4.x (or a compatible supported Ruby version)
* Google Chrome
* Bundler

## Install

```bash
bundle install
```

## Run all tests

```bash
bundle exec rspec
```

Tests run with a visible Chrome browser by default.

## Run individual suites

```bash
bundle exec rspec spec/tests/login_spec.rb
bundle exec rspec spec/tests/admin_spec.rb
bundle exec rspec spec/tests/pim_spec.rb
bundle exec rspec spec/tests/maintenance_spec.rb
```

## Project structure

```text
orangehrm-rspec-capybara/
├── Gemfile
├── Gemfile.lock
├── README.md
├── .gitignore
├── .rspec
└── spec/
    ├── spec_helper.rb
    ├── pages/
    │   ├── login_page.rb
    │   ├── admin_page.rb
    │   ├── pim_page.rb
    │   └── maintenance_page.rb
    └── tests/
        ├── login_spec.rb
        ├── admin_spec.rb
        ├── pim_spec.rb
        └── maintenance_spec.rb
```

**Page Object Model:** Each file in `spec/pages/` encapsulates the UI interactions and selectors for a page. Test files in `spec/tests/` focus on what to verify.

**Failure Screenshots:** If a test fails, a screenshot is automatically saved in the `screenshots/` directory for debugging.

## Notes

The test suite uses OrangeHRM's standard demo credentials:

* Username: `Admin`
* Password: `admin123`

The application under test is:

`https://opensource-demo.orangehrmlive.com`
