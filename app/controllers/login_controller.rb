class LoginController < ApplicationController
  before_action :index
  
  def index
    @user = User.new
  end
  
  # ログインチェック
  def auth
    usr = User.authenticate(params[:email], params[:passwd])
    # binding.pry
    if usr then
      # 成功した場合はid値をセッションに設定し、もともとの要求ページにリダイレクト
      # セッション情報を削除
      session[:usr] = usr.id
      redirect_to blogs_path
    else
      # 失敗した場合は、ログインページを再描画する
      @emsg = 'Eメール／パスワードが間違っていますぜ。'
      # redirect_to root_path  # "login/index.html.erb"
      render 'login/index'
      
    end
  end
  
  def logout
    reset_session
    render 'login/index'
    # redirect_to 'login/index'
  end
  
end
