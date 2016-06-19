class Records::PostsController < Records::BaseController
  def index
    @news = Post.on_records
  end

  def show
    @post = @news.find(params[:id])
  end
end
