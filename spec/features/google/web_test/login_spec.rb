require 'spec_helper'
app = AutomationFramework::Application.new
test_name = 'Personalized Awards - Login'

feature test_name.to_s, sauce: app.sauce do
  scenario test_name.to_s, type: 'acceptance', broken: false,
                           dev: true, qa: true, prod: true do

    app.launch_app(app.url('PA'))
    app.login_page.click_login
    app.login_page.login_function(app.user('PA'), app.pass('PA'))
    app.login_page.validate_login_success
    app.login_page.click_logout
    app.close_all_windows
  end
end
