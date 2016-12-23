module ReleasesHelper
  # renders html for a single review
  def render_review(release_type)
    html = link_to(release_type.title, release_type.url, target: '_blank')
    html << " / #{release_type.rating} out of #{release_type.max_rating} / in #{release_type.language}"
    html
  end

  # returns icon name based on release format
  def release_icon(release_format)
    release_icon = 'album'
    # TODO: other icons - vinyl, 7inch, lp + cd, digital + merch
    if release_format == ReleaseType::FORMAT_DIGITAL || release_format == ReleaseType::FORMAT_DIGITAL_MERCH
      release_icon = 'library_music'
    end
    release_icon

  end
end
