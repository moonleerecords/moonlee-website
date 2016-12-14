require 'net/http'

module Instagram
  class Media
    MEDIA_ENDPOINT = 'https://www.instagram.com/%s/media/'.freeze

    def initialize(username = 'moonleerecords')
      @username = username
    end

    def media
      media_url = format(MEDIA_ENDPOINT, @username)
      media_uri = URI(media_url)

      response = nil
      5.times do
        begin
          response = JSON.parse(Net::HTTP.get(media_uri))
        rescue StandardError
          next
        end
      end
      response
    end
  end
end
