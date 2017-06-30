class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, as: :source,dependent: :destroy
  validates_presence_of :name, :description
end
