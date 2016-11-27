module Records
  class ReleasesController < Records::BaseController
    before_action do
      promoted_releases(3)
      upcoming_events(5)
      social_posts
    end

    def index
      @releases = Release.internal_releases
    end

    def show
      @release = Release.friendly.find(params[:id])
      @cover_image = @release.cover
      # TODO: @release.cover_image
    end
  end
end
