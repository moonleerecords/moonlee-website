class ReleaseDecorator < Draper::Decorator
  delegate_all

  def artists_names(include_links = false)
    if object.split_release?
      return object.concat_artists_names unless include_links

      object.artists.map do |artist|
        if artist.name.index('/')
          artist.name.slice(0..artist.name.index('/') - 1).strip
        else
          artist.name
        end
      end
    end

    object.artists[0].name
  end
end
