require 'net/http'

module Instagram
  class Media
    MEDIA_ENDPOINT = 'https://api.instagram.com/v1/users/self/media/recent?access_token=%s'.freeze

    def media
      access_token = ENV['INSTAGRAM_ACCESS_TOKEN']

      media_uri = URI(format(MEDIA_ENDPOINT, access_token))

      response = nil
      5.times do
        begin
          response = JSON.parse(Net::HTTP.get(media_uri))

          return response
        rescue StandardError
          next
        end
      end
      response
    end
  end
end
