require 'spec_helper'

describe "games/edit" do
  before(:each) do
    @game = assign(:game, stub_model(Game,
      :name => "MyString",
      :parent_id => 1
    ))
  end

  it "renders the edit game form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", game_path(@game), "post" do
      assert_select "input#game_name[name=?]", "game[name]"
      assert_select "input#game_parent_id[name=?]", "game[parent_id]"
    end
  end
end
