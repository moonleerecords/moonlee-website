module Records
  class StaticsController < Records::BaseController
    before_action do
      promoted_releases(3)
      upcoming_events(5)
      social_posts
    end

    def about
    end
  end
end
