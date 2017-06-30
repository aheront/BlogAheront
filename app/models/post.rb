class Post < ApplicationRecord
  belongs_to :category
  has_many :comments, as: :source,dependent: :destroy

  has_attached_file :file
  do_not_validate_attachment_file_type :file
  validates_with AttachmentSizeValidator, attributes: :file, less_than: 2.megabytes
  validates_presence_of :name, :content

end
