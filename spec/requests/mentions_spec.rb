require 'spec_helper'

describe "Mentions" do
  describe "GET /mentions" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get "/mentions"
      response.status.should be(200)
    end
  end

  describe "GET /new_mentions" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get '/mentions/new'
      response.status.should be(200)
    end
  end

  describe "Upload Audio file" do
    before :each do
      visit('/mentions/new')
    end
    it "can upload audio file" do
      attach_file('File', 'spec/files/test.mp3')
      click_button('Create Mention')
      page.should have_content('Successfully created mention.')
      page.should have_content('test.mp3')
    end

    it "validate if user is uploading any file" do
      click_button('Create Mention')
      page.should have_content("File can't be blank")    
    end

  end
  describe "Delete a mention" do
    
  end
end
