require 'spec_helper'

describe "NewMentions" do
  describe "GET /new_mentions" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get '/mentions/new'
      response.status.should be(200)
    end
  end

  describe "Upload Audio file" do
    it "can upload audio file" do
      visit('/mentions/new')
      attach_file('File', 'spec/files/test.mp3')
      click('Create Mention')
      page.should have_content('Successfully created mention.')

    end
  end
end
