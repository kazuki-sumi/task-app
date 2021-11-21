class ArticleFile < ApplicationRecord
  mount_uploader :article_file, ArticleFileUploader
end
