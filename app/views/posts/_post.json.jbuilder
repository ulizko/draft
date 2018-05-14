json.extract! post, :id, :name, :content, :created_at, :updated_at, :category
json.url post_url(post, format: :json)