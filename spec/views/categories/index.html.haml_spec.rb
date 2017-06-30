require 'rails_helper'

RSpec.describe "categories/index", type: :view do
  before(:each) do
    assign(:categories, [
      Category.create!(
        :name => "Name",
        :description => "MyText"
      ),
      Category.create!(
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of categories" do
    render
    assert_select "h2", :text => "Name".to_s, :count => 2
    assert_select "p", :text => "MyText".to_s, :count => 2
  end
end
