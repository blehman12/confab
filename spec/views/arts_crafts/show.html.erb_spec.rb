require 'spec_helper'

describe "arts_crafts/show" do
  before(:each) do
    @arts_craft = assign(:arts_craft, stub_model(ArtsCraft,
      :name => "Name",
      :parent_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
  end
end
