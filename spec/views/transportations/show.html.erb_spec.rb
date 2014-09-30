require 'spec_helper'

describe "transportations/show" do
  before(:each) do
    @transportation = assign(:transportation, stub_model(Transportation,
      :name => "Name",
      :parent_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
  end
end
