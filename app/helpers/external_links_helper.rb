module ExternalLinksHelper
  def linked_icon(external_url, target = '_blank')
    link_to(fa_icon("#{external_url.url_type} 2x"), external_url.url, target: target) unless external_url.url_type == ''
  end
end
