require 'spec_helper'

wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds

describe "トップページ" do
  context "表示時" do
    it "うごく" do
      message = find_element(id: 'hello').text
      expect(message).to eq('Hello World!')
    end
  end
end
