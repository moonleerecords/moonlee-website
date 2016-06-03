class Records::ReleasesController < Records::BaseController
  before_action do
    promoted_releases(3)
    upcoming_events(5)
  end

  def index
    @releases = Release.internal
  end

  def show
    @release = Release.friendly.find(params[:id])
  end
end
