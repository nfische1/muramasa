require 'spec_helper'
app = AutomationFramework::Application.new
test_name = 'Search Google'

feature test_name.to_s, sauce: app.sauce do
  scenario test_name.to_s, type: 'acceptance', broken: false,
           dev: true, qa: true, prod: true do

    app.launch_app(app.url('GOOGLE'))
    app.google_landing_page.enter_search_text('Muramasa')
    app.google_landing_page.click_search
    app.close_all_windows
  end
end