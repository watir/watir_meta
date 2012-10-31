require File.expand_path('version', File.dirname(__FILE__))

module Watir
  class Browser
    class << self

      def new(browser=nil, *args)
        load_driver_for browser

        if Watir.driver == :webdriver
          # remove this class method for WebDriver to avoid endless loop
          singleton_class = class << self; self end
          singleton_class.send :remove_method, :new
        end

        new browser.nil? && Watir.driver == :webdriver ? :firefox : browser, *args
      end

      def start(url, browser=nil, *args)
        load_driver_for browser

        if Watir.driver == :webdriver
          start url, browser || :firefox, *args
        else
          start url
        end
      end

      def method_missing(name, *args, &block)
        Watir.load_driver
        send name, *args, &block
      end

      private

      def load_driver_for(browser)
        if browser && browser.to_sym != :ie && Watir.driver == :classic
          Watir.driver = :webdriver 
        end
        Watir.load_driver
      end

    end
  end

  class << self
    def load_driver
      require "watir-#{driver}"
    end

    def driver
      @driver || (ENV["WATIR_DRIVER"] && ENV["WATIR_DRIVER"].to_sym) || default_driver
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
