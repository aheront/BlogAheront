require 'rails_helper'

RSpec.describe Comment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before(:all) do
    @category = Category.create(name:'New category', description: 'New category description')
    @comment = Comment.create(author:'new comment', content: 'New comment content',source:@category)
  end

  it 'has comment for category' do
    @category.comments.should include(@comment)
  end

  it 'has comment author upper case' do
    @comment.author.should == 'New Comment'
  end

  it 'has exception if author < 2 words' do
    Comment.new(author:'newcomment', content: 'i',source:@category).should_not be_valid
  end

  it 'has exception if content nil' do
    Comment.new(author:'new comment', content: '',source:@category).should_not be_valid
  end

  it 'has exception if source nil' do
    Comment.new(author:'new comment', content: 'a',source:nil).should_not be_valid
  end

end
