class LoginController < ApplicationController
  before_action :new_act
  
  def index
  end
  
  # ログインチェック
  def auth
    
    usr = User.authenticate(params[:name], params[:passwd])
    
    if usr then
      # 成功した場合はid値をセッションに設定し、もともとの要求ページにリダイレクト
      # セッション情報を削除
      reset_session
      session[:usr] = usr.id
      redirect_to blogs_path
    else
      # 失敗した場合は、ログインページを再描画する
      @error = 'ユーザ名／パスワードが間違っていますぜ。'
      # render template: "login/index.html.erb"
      redirect_to controller: :login, action: :index
    end
  end
  
  private
    # 新規作成
    def new_act
      @user = User.new
    end
    
end
