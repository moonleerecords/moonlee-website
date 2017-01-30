module ReleasesHelper
  # renders html for a single review
  def render_review(release_type)
    html = link_to(release_type.title, release_type.url, target: '_blank')
    html << " / #{release_type.rating} out of #{release_type.max_rating} / in #{release_type.language}"
    html
  end

  # artists names with or without links
  def artists_names_linked(release)
    release.artists.map do |artist|
      if artist.name.index('/')
        artist_name_short = artist.name.slice(0..artist.name.index('/') - 1).strip
        link_to(artist_name_short, records_artist_path(artist), title: "Navigate to #{artist.name}")
      else
        link_to(artist.name, records_artist_path(artist), title: "Navigate to #{artist.name}")
      end
    end.join(' / ')
  end

  # artists names with or without links
  def artists_names(release, include_links = false)
    return release.concat_artists_names unless include_links
    release.artists.map do |artist|
      if artist.name.index('/')
        artist_name_short = artist.name.slice(0..artist.name.index('/') - 1).strip
        link_to(artist_name_short, records_artist_path(artist), title: "Navigate to #{artist.name}")
      else
        link_to(artist.name, records_artist_path(artist), title: "Navigate to #{artist.name}")
      end
    end.join(' / ')
  end

  # translates original release format to the one used for icon
  def release_icon_format(release_format)
    mappings = {
      ReleaseType::ALLOWED_FORMATS[:digital_merch] => ReleaseType::ALLOWED_FORMATS[:digital],
      ReleaseType::ALLOWED_FORMATS[:seven_inch] => ReleaseType::ALLOWED_FORMATS[:lp],
      ReleaseType::ALLOWED_FORMATS[:ten_inch] => ReleaseType::ALLOWED_FORMATS[:lp],
      ReleaseType::ALLOWED_FORMATS[:lp_cd] => ReleaseType::ALLOWED_FORMATS[:lp]
    }

    mappings[release_format].present? ? mappings[release_format] : release_format
  end
end
