require 'net/http'

module UrlHelper
  def url_exists?(url)
    uri = URI.parse(url)
    req = Net::HTTP.new(uri.host, uri.port)
    req.use_ssl = url.start_with?('https') ? true : false
    res = req.request_head(uri.path)
    true if res.code == '200'
  end
end
