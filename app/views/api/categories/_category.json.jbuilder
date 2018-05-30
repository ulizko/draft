json.extract! category, :id, :name, :description, :created_at, :updated_at
json.posts_count category.posts.count
json.comments_count category.comments.count
