require "rubygems"
require "appium_lib"

def desired_caps
  {
    caps: {
      browserName: '',
      #'appium-version': '1.3',
      platformName: 'iOS',
      platformVersion: '9.2',
      deviceName: 'iPhone 5s',
      app: 'platforms/ios/build/emulator/HelloCordova.app',
      autoWebview: true
    },
    appium_lib: {
      wait: 10
    }
  }
end

RSpec.configure { |c|
  c.before(:each) {
    @driver = Appium::Driver.new(desired_caps).start_driver
    @driver.manage.timeouts.implicit_wait = 5
    Appium.promote_appium_methods Object
  }

  c.after(:each) {
    @driver.quit
  }
}

