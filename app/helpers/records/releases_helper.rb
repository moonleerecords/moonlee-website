module Records
  module ReleasesHelper
    def render_review(title, url, rating, max_rating, language)
      html = link_to title, url, target: '_blank'
      html << " / #{rating} out of #{max_rating} / in #{language}"
      html
    end
  end
end
