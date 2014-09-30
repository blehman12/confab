require 'spec_helper'

describe "transportations/new" do
  before(:each) do
    assign(:transportation, stub_model(Transportation,
      :name => "MyString",
      :parent_id => 1
    ).as_new_record)
  end

  it "renders new transportation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", transportations_path, "post" do
      assert_select "input#transportation_name[name=?]", "transportation[name]"
      assert_select "input#transportation_parent_id[name=?]", "transportation[parent_id]"
    end
  end
end
