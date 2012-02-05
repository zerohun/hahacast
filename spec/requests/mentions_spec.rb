require 'spec_helper'

describe "Mentions" do
  describe "GET /mentions" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get "/mentions"
      response.status.should be(200)
    end
  end
end
