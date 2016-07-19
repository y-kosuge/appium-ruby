require 'spec_helper'

describe "トップページ" do
  context "表示時" do
    it "うごく" do
      message = find_element(id: 'hello').text
      expect(message).to eq('Hello World!')
    end
  end
end
