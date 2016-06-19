class Records::PostsController < Records::BaseController
  def index
    @news = Post.on_records
  end

  def show
    @post = Post.friendly.find(params[:id])
  end
end
