class Post < ApplicationRecord
  belongs_to :category
  has_many :comments, dependent: :destroy

  has_attached_file :file
  validates_attachment_content_type :file, :content_type => %w(image/jpeg image/jpg)

  def to_jq_upload
    {
        'name' => read_attribute(:file_name),
        'size' => read_attribute(:file_size),
        'url' => file.url(:original),
        'delete_url' => file.path(self),
        'delete_type' => "DELETE"
    }
  end
end
