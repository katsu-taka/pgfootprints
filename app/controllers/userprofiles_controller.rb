class UserprofilesController < ApplicationController
  before_action :set_userprofile, only: [:show, :edit, :update, :destroy]
  PER = 2
  
  # GET /userprofiles
  def index
    @userprofiles = Userprofile.page(params[:page]).per(PER)
  end
  
  # GET /userprofiles/1
  def show
    @userprofile = Userprofile.find(params[:id])
  end
  
  # GET /userprofiles/new
  def new
    @userprofile = Userprofile.new
  end
  
  # GET /useprofilers/1/edit
  def edit
  end
  
  # POST /userprofiles
  def create
    # binding.pry
    @userprofile = Userprofile.new(userprofile_params)
    
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
  
  def download
    @userprofile = Userprofile.find(params[:userprofile_id])
    # binding.pry
    send_data(
      @userprofile.photo,
      filename: @userprofile.pname,
      type: @userprofile.ptype,
      disposition: "inline"
     )
  end
  
  private
    # Useprofile callbacks to share common setup or constraints between actions.
    def set_userprofile
      @userprofile = Userprofile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def userprofile_params
      params.require(:userprofile).permit( :userid, :name, :photo, :bloodtype, :birthday, :address, :uploaded_picture )
    end

end
