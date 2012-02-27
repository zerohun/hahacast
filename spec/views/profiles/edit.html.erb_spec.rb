require 'spec_helper'

describe "profiles/edit" do
  before(:each) do
    @profile = assign(:profile, stub_model(Profile,
      :first_name => "MyString",
      :last_name => "MyString",
      :username => "MyString",
      :about => "MyString",
      :location => "MyString",
      :website => "MyString",
      :picture => "MyString"
    ))
  end

  it "renders the edit profile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => profiles_path(@profile), :method => "post" do
      assert_select "input#profile_first_name", :name => "profile[first_name]"
      assert_select "input#profile_last_name", :name => "profile[last_name]"
      assert_select "input#profile_username", :name => "profile[username]"
      assert_select "input#profile_about", :name => "profile[about]"
      assert_select "input#profile_location", :name => "profile[location]"
      assert_select "input#profile_website", :name => "profile[website]"
      assert_select "input#profile_picture", :name => "profile[picture]"
    end
  end
end
