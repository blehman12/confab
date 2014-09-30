require 'spec_helper'

describe "arts_crafts/edit" do
  before(:each) do
    @arts_craft = assign(:arts_craft, stub_model(ArtsCraft,
      :name => "MyString",
      :parent_id => 1
    ))
  end

  it "renders the edit arts_craft form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", arts_craft_path(@arts_craft), "post" do
      assert_select "input#arts_craft_name[name=?]", "arts_craft[name]"
      assert_select "input#arts_craft_parent_id[name=?]", "arts_craft[parent_id]"
    end
  end
end
