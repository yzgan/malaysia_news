json.extract! article, :id, :author, :title, :description, :url, :url_to_image, :published_at, :content, :search_id, :created_at, :updated_at
json.url article_url(article, format: :json)
