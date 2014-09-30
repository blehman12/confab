require 'spec_helper'

describe "businesses/new" do
  before(:each) do
    assign(:business, stub_model(Business,
      :name => "MyString",
      :parent_id => 1
    ).as_new_record)
  end

  it "renders new business form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", businesses_path, "post" do
      assert_select "input#business_name[name=?]", "business[name]"
      assert_select "input#business_parent_id[name=?]", "business[parent_id]"
    end
  end
end
