json.extract! video, :id, :title, :thumbnail, :subscription_required, :created_at, :updated_at
json.url video_url(video, format: :json)
