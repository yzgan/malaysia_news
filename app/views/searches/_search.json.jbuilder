json.extract! search, :id, :status, :total_results, :created_at, :updated_at
json.url search_url(search, format: :json)
