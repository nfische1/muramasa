require 'capybara/rspec'
require 'capybara'
require 'sauce_whisk'
require 'rspec'
require 'json'
#require 'eyes_selenium'
require 'support/utilities'
require 'support/application'
require 'rspec/expectations'
require 'require_all'
require 'net/https'
require 'colorize'
require 'rspec/retry'
require 'oauth2'
require 'appium_lib'
require 'selenium-webdriver'
require 'pry'
require 'pry-remote'
require 'dotenv'
require 'rspec-html-matchers'
include RSpec::Core::Pending
include RSpecHtmlMatchers


require_rel '/support/apps/'

app_env = ENV.fetch('APP_ENV', 'dev')
usesauce = ENV.fetch('USESAUCE', false)

dotenv_files = [
    ".env.#{app_env}.local",
    ".env.local",
    ".env.#{app_env}",
    ".env"
].compact
Dotenv.load(*dotenv_files)

Capybara.register_driver :selenium do |app|
  if usesauce
    puts 'Using Sauce'
    capabilities = {
      :version => ENV['version'],
      :browserName => ENV['browserName'],
      :platform => ENV['platform'],
    }
    url = "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@ondemand.saucelabs.com:80/wd/hub".strip
    Capybara::Selenium::Driver.new(app, :browser => :remote, :url => url, :desired_capabilities => capabilities)
  else
    puts 'Using Selenium'
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  end
  #@eyes = Applitools::Eyes.new
  #@eyes.api_key = "#{ENV['APPLITOOLS_ACCESS_KEY']}"
end


Capybara.configure do |config|
  config.default_driver = :selenium
  config.reset_session!
  config.run_server = true
  config.default_max_wait_time = 15
  config.match = :prefer_exact
  config.exact_options = true
  config.ignore_hidden_elements = true
  config.visible_text_only = true
  config.automatic_reload = true
end

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include Capybara::RSpecMatchers
  config.include RSpecHtmlMatchers
  config.formatter = :documentation
  config.verbose_retry = true
  config.display_try_failure_messages = true
  config.default_retry_count = 2
  config.default_sleep_interval = 2
  config.filter_run_excluding broken: true
  ignore_app = Hash[ENV.fetch('APP_ENV', 'dev'), false]
  config.filter_run_excluding ignore_app
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end


  config.after(:each) do |scenario|
    if usesauce
      jobname = scenario.full_description
      sessionid = ::Capybara.current_session.driver.browser.session_id
      ::Capybara.current_session.driver.quit
      puts "SauceOnDemandSessionID=#{sessionid} job-name=#{jobname}"
      job = SauceWhisk::Jobs.fetch sessionid
      job.name = jobname
      job.save
      if scenario.exception
        SauceWhisk::Jobs.fail_job sessionid
      else
        SauceWhisk::Jobs.pass_job sessionid
      end
    end
    Capybara.reset_sessions!
    #@eyes.close
  end
end
