module Records
  class PostsController < Records::BaseController
    before_action do
      promoted_releases(3)
      upcoming_events(5)
      social_posts
    end

    def index
      @news = Post.on_records
    end

    def show
      @post = Post.friendly.find(params[:id])
    end
  end
end
