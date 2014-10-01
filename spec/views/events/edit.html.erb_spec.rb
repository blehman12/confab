require 'spec_helper'

describe "events/edit" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :name => "MyString",
      :location => "MyString",
      :address => "MyString",
      :recurrence => "MyString",
      :user => "",
      :user_id => 1,
      :contact => "MyString",
      :theme => "MyString",
      :category => "MyString",
      :subcategoryA => "MyString",
      :subcategoryB => "MyString",
      :subcategoryC => "MyString"
    ))
  end

  it "renders the edit event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", event_path(@event), "post" do
      assert_select "input#event_name[name=?]", "event[name]"
      assert_select "input#event_location[name=?]", "event[location]"
      assert_select "input#event_address[name=?]", "event[address]"
      assert_select "input#event_recurrence[name=?]", "event[recurrence]"
      assert_select "input#event_user[name=?]", "event[user]"
      assert_select "input#event_user_id[name=?]", "event[user_id]"
      assert_select "input#event_contact[name=?]", "event[contact]"
      assert_select "input#event_theme[name=?]", "event[theme]"
      assert_select "input#event_category[name=?]", "event[category]"
      assert_select "input#event_subcategoryA[name=?]", "event[subcategoryA]"
      assert_select "input#event_subcategoryB[name=?]", "event[subcategoryB]"
      assert_select "input#event_subcategoryC[name=?]", "event[subcategoryC]"
    end
  end
end
