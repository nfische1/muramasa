module AutomationFramework
  class Application < AutomationFramework::Utilities

    def login_page
      @login_page ||= LoginPage.new
    end

  end
end
