module YoutubeVideo
  def youtube_video_id(url)
    regex = %r{/(?:.be\/|\/watch\?v=|\/embed\/|\/(?=p\/))([\w\/\-]+)/}
    url.match(regex)[1]
  end
end
