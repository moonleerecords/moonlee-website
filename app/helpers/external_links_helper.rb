module ExternalLinksHelper
  def linked_icon(external_url, target = '_blank')
    # TODO: rewrite this after jspm
    # TODO: bandcamp icon, discogs icon
    unless external_url.url_type == ''
      link_to(fa_icon("#{external_url.url_type} 2x"), external_url.url, target: target)
    end
  end
end
