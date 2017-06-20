class VideoService < ApiService
  def list_videos
    begin
      response = RestClient.get("https://api.zype.com/videos?app_key=#{@app_key}")
    rescue 
      raise ActionController::RoutingError.new('Unauthorized')
    end

    arr_videos = Array.new

    json_videos = JSON.parse(response.body, :symbolize_names => true)
    json_videos[:response].each do |c_video|
      current_video = Video.find_or_create_by(identifier: c_video[:_id])
      current_video.update_attributes({title: c_video[:title], thumbnail: c_video[:thumbnails].first[:url], subscription_required: c_video[:subscription_required]})
      current_video.save
      arr_videos.push(current_video)
    end

    arr_videos
  end

  def get_video_url(video)
    "https://player.zype.com/embed/#{video.identifier}.js?autoplay=true&app_key=#{@app_key}"
  end
end
