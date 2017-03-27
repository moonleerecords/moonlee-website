module Records
  class HomeController < Records::BaseController
    before_action do
      promoted_releases(5)
      upcoming_events(5)
      social_posts
    end

    def index
      @news = Post.on_records.published.first(3)
      @slides = Slide.on_records.active
      meta_tags('', '')
    end
  end
end
