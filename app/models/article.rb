class Article < ApplicationRecord
  extend Enumerize
  paginates_per 20

  enumerize :status, in: { draft: 1, published: 2 }, scope: true

  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 30000 }
  validates :published_at, presence: true
  validates :status, presence: true
end
