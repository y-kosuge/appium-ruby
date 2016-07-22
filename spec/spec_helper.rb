require "rubygems"
require "appium_lib"

def desired_caps
  test_device = ENV['TEST_DEVICE']
  case test_device
  when 'ios'
    {
      caps: {
        browserName: '',
        'appium-version': '1.3',
        platformName: 'iOS',
        platformVersion: '9.2',
        deviceName: 'iPhone 5s',
        app: 'platforms/ios/build/emulator/HelloCordova.app',
        autoWebview: true,
        autoWebViewTimeout: 10000
      },
      appium_lib: {
        wait: 10
      }
    }
  when 'android'
    {
      caps: {
        platformName:  "Android",
        versionNumber: "4.1",
        deviceName:    "Android Emulator",
        avd: 'Nexus_5_API_21_x86',
        app: 'platforms/android/build/outputs/apk/android-debug.apk',
        :"app-activity" => '.MainActivity',
        autoWebview: true,
        autoWebViewTimeout: 10000
      },
      appium_lib: {
        wait: 10
      }
    }
  else
    raise "環境変数 TEST_DEVICE に'android'または'ios'を設定してください"
  end
end

RSpec.configure { |c|
  c.before(:each) {
    @driver = Appium::Driver.new(desired_caps).start_driver
    @driver.manage.timeouts.implicit_wait = 10
    Appium.promote_appium_methods Object
  }

  c.after(:each) {
    @driver.quit
  }
}

