json.extract! event, :id, :title, :description, :image_url, :start_date, :end_date, :created_at, :updated_at
json.url event_url(event, format: :json)
