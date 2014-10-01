require 'spec_helper'

describe "events/index" do
  before(:each) do
    assign(:events, [
      stub_model(Event,
        :name => "Name",
        :location => "Location",
        :address => "Address",
        :recurrence => "Recurrence",
        :user => "",
        :user_id => 1,
        :contact => "Contact",
        :theme => "Theme",
        :category => "Category",
        :subcategoryA => "Subcategory A",
        :subcategoryB => "Subcategory B",
        :subcategoryC => "Subcategory C"
      ),
      stub_model(Event,
        :name => "Name",
        :location => "Location",
        :address => "Address",
        :recurrence => "Recurrence",
        :user => "",
        :user_id => 1,
        :contact => "Contact",
        :theme => "Theme",
        :category => "Category",
        :subcategoryA => "Subcategory A",
        :subcategoryB => "Subcategory B",
        :subcategoryC => "Subcategory C"
      )
    ])
  end

  it "renders a list of events" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Recurrence".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Contact".to_s, :count => 2
    assert_select "tr>td", :text => "Theme".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
    assert_select "tr>td", :text => "Subcategory A".to_s, :count => 2
    assert_select "tr>td", :text => "Subcategory B".to_s, :count => 2
    assert_select "tr>td", :text => "Subcategory C".to_s, :count => 2
  end
end
