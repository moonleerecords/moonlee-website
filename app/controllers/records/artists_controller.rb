module Records
  class ArtistsController < Records::BaseController
    before_action do
      promoted_releases(3)
      upcoming_events(5)
      social_posts
    end

    def index
      @artists = Artist.on_records
      meta_tags('Artists', 'Label artists')
    end

    def show
      @artist = Artist.friendly.find(params[:id])
      @cover_image = @artist.image
      meta_tags(@artist.name, @artist.description, @artist.image.url(:large))
    end
  end
end
