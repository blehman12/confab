require 'spec_helper'

describe "businesses/edit" do
  before(:each) do
    @business = assign(:business, stub_model(Business,
      :name => "MyString",
      :parent_id => 1
    ))
  end

  it "renders the edit business form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", business_path(@business), "post" do
      assert_select "input#business_name[name=?]", "business[name]"
      assert_select "input#business_parent_id[name=?]", "business[parent_id]"
    end
  end
end
