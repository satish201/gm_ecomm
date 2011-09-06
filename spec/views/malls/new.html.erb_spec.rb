require 'spec_helper'

describe "malls/new.html.erb" do
  before(:each) do
    assign(:mall, stub_model(Mall,
      :mallname => "MyString",
      :city => "MyString",
      :country => "MyString",
      :address => "MyText",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new mall form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => malls_path, :method => "post" do
      assert_select "input#mall_mallname", :name => "mall[mallname]"
      assert_select "input#mall_city", :name => "mall[city]"
      assert_select "input#mall_country", :name => "mall[country]"
      assert_select "textarea#mall_address", :name => "mall[address]"
      assert_select "textarea#mall_description", :name => "mall[description]"
    end
  end
end
