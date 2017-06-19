module VideosHelper
  def video_player(video=nil)
    "<div id='zype_#{video.identifier}'></div><script src='#{VideoService.new().get_video_url(video)}' type='text/javascript'></script>".strip
  end
end
