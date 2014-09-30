require 'spec_helper'

describe "arts_crafts/new" do
  before(:each) do
    assign(:arts_craft, stub_model(ArtsCraft,
      :name => "MyString",
      :parent_id => 1
    ).as_new_record)
  end

  it "renders new arts_craft form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", arts_crafts_path, "post" do
      assert_select "input#arts_craft_name[name=?]", "arts_craft[name]"
      assert_select "input#arts_craft_parent_id[name=?]", "arts_craft[parent_id]"
    end
  end
end
