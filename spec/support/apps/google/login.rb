class LoginPage < AutomationFramework::Utilities
  include Capybara::DSL
  include Header

  def login_function(user, pass)
    page.fill_in 'user[username]', with: user
    page.fill_in 'user[password]', with: pass
    page.find(:css, "input[name='commit']").click
  end
end