class ArticleFile < ApplicationRecord
  mount_uploader :file, ArticleFileUploader

  validates :name, presence: true, length: { maximum: 255 }
  validates :file, presence: true
  validates :content_type, presence: true
end
