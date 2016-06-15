class Records::HomeController < Records::BaseController
  before_action do
    promoted_releases(5)
    upcoming_events(5)
  end

  def index
    # TODO: @latest_news = Post.on_records
    # TODO: use this for private posts
    # if admin_user_signed_in?
    #   puts 'hello mr. admin'
    # end
    # TODO: latest adds to the store
  end
end
