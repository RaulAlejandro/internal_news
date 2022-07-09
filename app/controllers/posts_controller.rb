class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :logged_in?

  def index
    @posts = Post.all
  end

  def show
  end

  def search
    @posts = Post.search(params[:author], params[:start_date], params[:end_date], params[:order_by])    
    respond_to do |format|
      format.html
      format.js { render :layout => false }
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Noticia Creada Correctamente" }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content, :summary, :user_id, :image)
    end
end
