json.extract! comment, :id, :content, :playlist_id, :user_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
