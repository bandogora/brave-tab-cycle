# frozen_string_literal: true

require 'selenium-webdriver'

Selenium::WebDriver::Chrome::Service.driver_path = File.expand_path('~/.webdrivers/chromedriver', __dir__)
options = Selenium::WebDriver::Chrome::Options.new
options.add_argument("--user-data-dir=#{File.expand_path('~/.config/BraveSoftware/Brave-Browser')}")
driver = Selenium::WebDriver.for(:chrome, options: options)

tabs = [driver.get('chrome://newtab').to_s]


4.times do
  tabs << driver.manage.new_window
end

loop do
  tabs.each do |tab|
    driver.switch_to.window tab
    driver.navigate.to 'chrome://newtab'
  end
end

driver.quit
