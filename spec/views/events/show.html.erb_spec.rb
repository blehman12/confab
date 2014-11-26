require 'spec_helper'

describe "events/show" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Location/)
    rendered.should match(/Address/)
    rendered.should match(/Recurrence/)
    rendered.should match(//)
    rendered.should match(/1/)
    rendered.should match(/Contact/)
    rendered.should match(/Theme/)
    rendered.should match(/Category/)
    rendered.should match(/Subcategory A/)
    rendered.should match(/Subcategory B/)
    rendered.should match(/Subcategory C/)
  end
end
