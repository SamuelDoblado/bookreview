json.extract! reviewer, :id, :name, :password, :created_at, :updated_at
json.url reviewer_url(reviewer, format: :json)
