module AutomationFramework
  class Application < AutomationFramework::Utilities

    def google_landing_page
      @google_landing_page ||= GoogleLandingPage.new
    end

    def oct_landing_page
      @oct_landing_page ||= OCTLandingPage.new
    end

  end
end
