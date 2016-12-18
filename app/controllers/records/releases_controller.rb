module Records
  class ReleasesController < Records::BaseController
    before_action do
      promoted_releases(3)
      upcoming_events(5)
      social_posts
    end

    def index
      @releases = Release.internal_releases
      meta_tags('Releases', 'Releases from our artists')
    end

    def show
      @release = Release.friendly.find(params[:id])
      @cover_image = @release.artists.first.image
      meta_tags("#{@release.artists_names} - #{@release.title}", @release.description, @release.cover.url(:large))
    end
  end
end
