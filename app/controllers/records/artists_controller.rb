class Records::ArtistsController < Records::BaseController
  before_action do
    promoted_releases(3)
    upcoming_events(5)
  end

  def index
    @artists = Artist.on_records
  end

  def show
    @artist = Artist.friendly.find(params[:id])
  end
end
