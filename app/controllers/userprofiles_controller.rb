class UserprofilesController < ApplicationController
  before_action :set_userprofile, only: [:show, :edit, :update, :destroy]
  PER = 2
  
  # GET /userprofiles
  def index
    @userprofiles = Userprofile.page(params[:page]).per(PER)
  end
  
  # GET /userprofiles/1
  def show
  end
  
  # GET /userprofiles/new
  def new
    @userprofile = Userprofile.new
    # render 'blogs/index'
  end
  
  # GET /useprofilers/1/edit
  def edit
  end
  
  # POST /userprofiles
  def create
    
    photo = userprofile_params[:photo]
    userprofile = {}
    if photo != nil
      userprofile[:photo] = photo.read
      # userprofile[:photo] = photo.original_filename
    end
    # binding.pry
    # @userprofile = Userprofile.new(userprofile_params)
    @userprofile = Userprofile.new(userprofile)
    
    if @userprofile.save
      redirect_to blogs_path, notice: 'プロフィールを登録しました'
    else
      render template: "blogs/index.html.erb"
    end
  end
  
  # PATCH/PUT /userprofiles/1
  def update
      if @userprofile.update(userprofile_params)
        redirect_to @userprofile, notice: 'プロフィールを更新しました'
      else
        render :edit
      end
  end
  
  # DELETE /userprofiles/1
  def destroy
    @userprofile.destroy
    redirect_to blogs_path, notice: 'プロフィールを削除しました'
  end
  
  private
    # Useprofile callbacks to share common setup or constraints between actions.
    def set_userprofile
      @userprofile = Userprofile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def userprofile_params
      params.require(:userprofile).permit( :name, :photo, :bloodtype, :birthday, :address )
      # params.require(:userprofile).permit( :name, :bloodtype, :birthday, :address )
    end
    
    def uploadimg(img_object,photo_name)
      ext = photo_name[photo_name.rindex('.') + 1, 4].downcase
      perms = ['.jpg', '.jpeg', '.gif', '.png']
      if !perms.include?(File.extname(photo_name).downcase)
        result = 'アップロードできるのは画像ファイルのみです。'
      elsif img_object.size > 4.megabyte
        result = 'ファイルサイズは4MBまでです。'
      else
        File.open("public/#{photo_name.toutf8}", 'wb') { |f| f.write(img_object.read) }
        result = "success"
      end
      return result
    end

end
