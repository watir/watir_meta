# Watir
![Watir Logo](https://raw.github.com/watir/watir/master/watir.gif "Watir Logo")

Watir, pronounced water, is an open-source (BSD) family of Ruby libraries for automating web browsers.
It supports your app no matter what technology it is developed in.
They support Internet Explorer on Windows, Firefox and Chrome on Windows, Mac and Linux.


## About

This is the meta-gem for installing all necessary dependencies and having a convenient way to switch between different Watir drivers.    

Currently supported drivers are:
 - [watir-classic](https://github.com/watir/watir-classic)
 - [watir-webdriver](https://github.com/watir/watir-webdriver)

Visit [Watir website](http://watir.com) or refer to each gem's own README and documentation for better understanding of how to use these libraries.

## Watir Related Libraries

### Integration

* [watir-rails](https://github.com/watir/watir-rails) for using Watir with Rails.
* * [watir-rspec](https://github.com/watir/watir-rspec) for writing your tests with RSpec.
* [watir-robot](https://github.com/semperos/watir-robot) for using Watir with Robot Framework.

### Frameworks

* [page-object](https://github.com/cheezy/page-object)
* [test-page](https://github.com/jarmo/test-page)
* [test-factory](https://github.com/rSmart/TestFactory)
* [watirmark](https://github.com/convio/watirmark)
* [watirsome](https://github.com/p0deje/watirsome)

### Other

* [watir-webdriver-performance](https://github.com/90kts/watir-webdriver-performance) for monitoring web application performance.

## Usage

Add it into your Gemfile:
````ruby
gem "watir", "~>4.0"
````

Or install it manually with the following command:
````   
gem install watir
````

Then in your test file:
````ruby
require "watir"
browser = Watir::Browser.new
````

The command above will use watir-classic with Internet Explorer on Windows and
watir-webdriver with Firefox on Linux/OS X by default.


## Switching Between Drivers

There are multiple ways to specify a different driver.

By specifying different browser via ````#initialize````:
````ruby    
require "watir"
# will use watir-webdriver with Chrome
browser = Watir::Browser.new :chrome
````

By specifying driver manually via ````Watir.driver#=````:
````ruby    
require "watir"
# will use watir-webdriver with Internet Explorer
Watir.driver = :webdriver
browser = Watir::Browser.new :ie
````

Or by using an environment variable ````WATIR_DRIVER````:
````ruby
require "watir"
# will use watir-classic
ENV["WATIR_DRIVER"] = "classic"
browser = Watir::Browser.new
````


## Limitations

Currently it is possible to use only one driver per Ruby process. All the
methods to switch between drivers won't have any effect after you've opened
your first browser window.


## License

See [LICENSE](https://github.com/watir/watir/blob/master/LICENSE) for details.
