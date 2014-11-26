require 'spec_helper'

describe "categories/edit" do
  before(:each) do
    @category = assign(:category, stub_model(Category,
      :category => "MyString",
      :theme_id => 1
    ))
  end

  it "renders the edit category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", category_path(@category), "post" do
      assert_select "input#category_category[name=?]", "category[category]"
      assert_select "input#category_theme_id[name=?]", "category[theme_id]"
    end
  end
end
