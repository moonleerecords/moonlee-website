module Records
  class ReleasesController < Records::BaseController
    before_action do
      promoted_releases(5)
    end

    def index
      @releases = Release.internal_releases
    end

    def show
      @release = Release.friendly.find(params[:id])
    end
  end
end
