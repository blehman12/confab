require 'spec_helper'

describe "themes/new" do
  before(:each) do
    assign(:theme, stub_model(Theme,
      :theme => "MyString"
    ).as_new_record)
  end

  it "renders new theme form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", themes_path, "post" do
      assert_select "input#theme_theme[name=?]", "theme[theme]"
    end
  end
end
