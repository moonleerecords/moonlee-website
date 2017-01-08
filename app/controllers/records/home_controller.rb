module Records
  class HomeController < Records::BaseController
    before_action do
      promoted_releases(5)
      upcoming_events(5)
      social_posts
    end

    def index
      @news = Post.on_records.published.first(3)
      @slides = Slide.on_records
      # TODO: use this for private (not published) posts
      # if admin_user_signed_in?
      #   puts 'hello mr. admin'
      # end
      meta_tags('', '')
    end
  end
end
