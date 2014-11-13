class BlogsController < ApplicationController
  
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  PER = 3
  
  # GET /blogs(.json)
  def index
    # @blogs = Blog.all
    @blogs = Blog.page(params[:page]).per(PER)
  end
  
  # GET /blogs/1(.json)
  def show
  end
  
  # GET /blogs/new
  def new
    @blog = Blog.new
  end
  
  # GET /blogs/1/edit
  def edit
  end
  
  # POST /blogs(.json)
  def create
    @blog = Blog.new(blog_params)
    # respond_to do |format|
      if @blog.save
        # format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        # format.json { render :show, status: :created, location: @blog }
        redirect_to @blog, notice: 'Blog was successfully created.'
      else
        # format.html { render template: "" }
        # format.json { render json: @blog.errors, status: :unprocessable_entity }
        render template: ""
      end
    # end
  end
  
  # PATCH/PUT /blogs/1(.json)
  def update
    # respond_to do |format|
      if @blog.update(blog_params)
        # format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        # format.json { render :show, status: :ok, location: @blog }
        redirect_to @blog, notice: 'Blog was successfully updated.'
      else
        # format.html { render :edit }
        # format.json { render json: @blog.errors, status: :unprocessable_entity }
        render :edit
      end
    # end
  end
  
  # DELETE /blogs/1(.json)
  def destroy
    @blog.destroy
    # respond_to do |format|
      # format.html { redirect_to blogs_url, notice: 'BLog was successfully destroyed.' }
      # format.json { head :no_content }
      redirect_to blogs_url, notice: 'BLog was successfully destroyed.'
    # end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit( :userid, :title, :content, :program, :reference )
    end
    
end
