module Records
  class PostsController < Records::BaseController
    before_action do
      promoted_releases(3)
      upcoming_events(5)
      social_posts
    end

    def index
      @news = Post.on_records.page params[:page]
      meta_tags('News', 'Latest news from Moonlee Records')
    end

    def show
      @post = Post.friendly.find(params[:id])
      @latest_news = Post.on_records.limit(5)
      @cover_image = @post.image
      meta_tags(@post.title, @post.body, @post.image.url(:large))
    end
  end
end
