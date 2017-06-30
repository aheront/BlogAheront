require 'rails_helper'

RSpec.describe Post, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before(:all) do
    @category = Category.create(name:'New category', description: 'New category description')
    @post = Post.create(name:'New post', content: 'New post',category:@category)
  end

  it 'has list of categories' do
    @category.posts.should include(@post)
  end

  it 'required name' do
    Post.new(name:'', content: 'i',category:@category).should_not be_valid
  end

  it 'required content' do
    Post.new(name:'a', content: '',category:@category).should_not be_valid
  end

  it 'required category' do
    Post.new(name:'a', content: 'i',category:nil).should_not be_valid
  end

end
