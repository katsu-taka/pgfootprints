class BlogsController < ApplicationController
  
  before_action :check_logined
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  PER = 10
  
  # GET /blogs
  def index
    # @blogs = Blog.all
    if params[:user_id]
      @user = User.find(params[:user_id])
      @blogs = @user.blogs.page(params[:page]).per(PER)
      
    else
      @blogs = Blog.page(params[:page]).per(PER)
      @users = User.all
    end
  end
  
  # GET /blogs/1
  def show
  end
  
  # GET /blogs/new
  def new
    @blog = Blog.new
  end
  
  # GET /blogs/1/edit
  def edit
  end
  
  # POST /blogs
  def create
    @blog = Blog.new(blog_params)
      if @blog.save
        redirect_to @blog, notice: 'ブログを作成しました'
      else
        render :new
      end
    # end
  end
  
  # PATCH/PUT /blogs/1(.json)
  def update
    if @blog.update(blog_params)
      redirect_to @blog, notice: 'ブログを更新しました'
    else
      render :edit
    end
  end
  
  # DELETE /blogs/1(.json)
  def destroy
    @blog.destroy
    redirect_to blogs_url, notice: 'ブログを削除しました'
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit( :user_id, :title, :content, :program, :reference )
    end
    
end
