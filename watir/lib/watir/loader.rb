require File.expand_path('version', File.dirname(__FILE__))

module Watir
  class Browser
    def initialize(browser=nil, *args)
      self.class.load_driver_for browser

      # execute just loaded driver's #initialize
      initialize browser.nil? && Watir.driver == :webdriver ? :firefox : browser, *args
    end

    class << self
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
        return super unless respond_to? name
        send name, *args, &block
      end

      def load_driver_for(browser)
        if browser && browser.respond_to?(:to_sym) && browser.to_sym != :ie && Watir.driver == :classic
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
