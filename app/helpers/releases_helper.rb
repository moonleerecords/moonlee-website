module ReleasesHelper
  # renders html for a single review
  def render_review(release_type)
    html = link_to(release_type.title, release_type.url, target: '_blank')
    html << " / #{release_type.rating} out of #{release_type.max_rating} / in #{release_type.language}"
    html
  end
end
