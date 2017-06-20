module VideosHelper
  def video_player(video=nil)
    content_tag(:div, nil, id:"zype_#{video.identifier}")+content_tag(:script, nil, src: VideoService.new().get_video_url(video), type:"text/javascript")
  end
end
