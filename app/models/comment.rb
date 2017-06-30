class Comment < ApplicationRecord

  belongs_to :source, polymorphic: true
  validates_presence_of :author, :content

  validates :author, format: { with: /.[\s]./}

  def author=(s)
    write_attribute(:author, s.to_s.titleize)
  end

end
