require 'spec_helper'

describe "malls/index.html.erb" do
  before(:each) do
    assign(:malls, [
      stub_model(Mall,
        :mallname => "Mallname",
        :city => "City",
        :country => "Country",
        :address => "MyText",
        :description => "MyText"
      ),
      stub_model(Mall,
        :mallname => "Mallname",
        :city => "City",
        :country => "Country",
        :address => "MyText",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of malls" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Mallname".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "City".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
