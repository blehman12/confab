require 'spec_helper'

describe "transportations/edit" do
  before(:each) do
    @transportation = assign(:transportation, stub_model(Transportation,
      :name => "MyString",
      :parent_id => 1
    ))
  end

  it "renders the edit transportation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", transportation_path(@transportation), "post" do
      assert_select "input#transportation_name[name=?]", "transportation[name]"
      assert_select "input#transportation_parent_id[name=?]", "transportation[parent_id]"
    end
  end
end
