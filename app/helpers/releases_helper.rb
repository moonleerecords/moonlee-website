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
      if artist.name.index('/').present?
        link_to(
          artist.name.slice(0..artist.name.index('/') - 1).strip,
          records_artist_path(artist),
          title: "Navigate to #{artist.name}"
        )
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
        link_to(
          artist.name.slice(0..artist.name.index('/') - 1).strip,
          records_artist_path(artist),
          title: "Navigate to #{artist.name}"
        )
      else
        link_to(artist.name, records_artist_path(artist), title: "Navigate to #{artist.name}")
      end
    end.join(' / ')
  end

  # translates original release format to the one used for icon
  def release_icon_format(release_format)
    mappings = {
      ReleaseType::FORMAT_DIGITAL_MERCH => ReleaseType::FORMAT_DIGITAL,
      ReleaseType::FORMAT_7INCH => ReleaseType::FORMAT_LP,
      ReleaseType::FORMAT_10INCH => ReleaseType::FORMAT_LP,
      ReleaseType::FORMAT_LP_CD => ReleaseType::FORMAT_LP
    }

    mappings[release_format].present? ? mappings[release_format] : release_format
  end
end
