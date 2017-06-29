require 'rails_helper'

RSpec.describe "comments/new", type: :view do
  before(:each) do
    assign(:comment, Comment.new(
      :author => "MyString",
      :content => "MyText",
      :post => nil
    ))
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", comments_path, "post" do

      assert_select "input#comment_author[name=?]", "comment[author]"

      assert_select "textarea#comment_content[name=?]", "comment[content]"

      assert_select "input#comment_post_id[name=?]", "comment[post_id]"
    end
  end
end
