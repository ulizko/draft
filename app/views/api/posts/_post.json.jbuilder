json.extract! post, :id, :name, :content, :created_at, :updated_at
json.comments_count post.comments.count
