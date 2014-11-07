require 'spec_helper'

describe "categories/new" do
  before(:each) do
    assign(:category, stub_model(Category,
      :category => "MyString",
      :theme_id => 1
    ).as_new_record)
  end

  it "renders new category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", categories_path, "post" do
      assert_select "input#category_category[name=?]", "category[category]"
      assert_select "input#category_theme_id[name=?]", "category[theme_id]"
    end
  end
end
