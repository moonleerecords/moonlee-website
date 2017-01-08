module YoutubeVideo
  def youtube_video_id(url)
    regex = /(?:.be\/|\/watch\?v=|\/embed\/|\/(?=p\/))([\w\/\-]+)/
    url.match(regex)[1]
  end
end