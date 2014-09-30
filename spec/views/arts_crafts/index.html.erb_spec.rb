require 'spec_helper'

describe "arts_crafts/index" do
  before(:each) do
    assign(:arts_crafts, [
      stub_model(ArtsCraft,
        :name => "Name",
        :parent_id => 1
      ),
      stub_model(ArtsCraft,
        :name => "Name",
        :parent_id => 1
      )
    ])
  end

  it "renders a list of arts_crafts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
