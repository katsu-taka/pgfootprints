class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  PER = 10
  
  # GET /users
  def index
    @users = User.page(params[:page]).per(PER)
  end
  
  # GET /users/1
  def show
  end
  
  # GET /users/new
  def new
    @user = User.new
    render 'login/index'
  end
  
  # GET /users/1/edit
  def edit
  end
  
  # POST /users
  def create
    @user = User.new(user_params)
      if @user.save
        usr = @user
        if usr then
          # 成功した場合はid値をセッションに設定し、もともとの要求ページにリダイレクト, セッション情報を削除
          session[:usr] = usr.id
        end
        redirect_to blogs_path, notice: 'ユーザを登録しました'
      else
        render template: "login/index.html.erb"
    end
  end
  
  # PATCH/PUT /users/1
  def update
      if @user.update(user_params)
        redirect_to @user, notice: 'ユーザ情報を更新しました'
      else
        render :edit
      end
  end
  
  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'ユーザ情報を削除しました'
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit( :name, :email, :passwd )
    end
  
end
