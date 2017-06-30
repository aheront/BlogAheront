require 'rails_helper'

RSpec.describe Category, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before(:all) do
    @category = Category.create(name:"New category", description: "New category description")
  end

  it 'has list of categories' do
    Category.all.should include(@category)
  end

end





