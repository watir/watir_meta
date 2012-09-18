require File.expand_path('version', File.dirname(__FILE__))

module Watir
  class Browser
    class << self
      def new(browser=nil, *args)
        if browser && browser.to_sym != :ie && Watir.driver == :classic
          Watir.driver = :webdriver 
        end
        Watir.load_driver

        if Watir.driver == :webdriver
          # remove this class method for WebDriver to avoid endless loop
          singleton_class = class << self; self end
          singleton_class.send :remove_method, :new
        end

        new browser.nil? && Watir.driver == :webdriver ? :firefox : browser, *args
      end
    end
  end

  class << self
    def load_driver
      require "watir-#{driver}"
    rescue LoadError
      warn "watir-#{driver} gem is missing. Install it with the following command:"
      warn "  gem install watir-#{driver}"
      exit 1
    end

    def driver
      @driver || ENV["WATIR_DRIVER"] || default_driver
    end

    def driver=(driver)
      allowed_drivers = %w[webdriver classic]
      unless allowed_drivers.map(&:to_sym).include?(driver.to_sym)
        raise "Supported drivers are #{allowed_drivers.join(", ")}." 
      end
      @driver = driver
    end

    def default_driver
      if ENV['OS'] == 'Windows_NT'
        :classic
      else
        :webdriver
      end
    end
  end
end
