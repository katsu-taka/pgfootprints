class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def check_logined
    if session[:usr] then
      # 存在する場合はusersテーブルを検索し、ユーザ情報を取得
      begin
        @usr = User.find(session[:usr])
      rescue ActiveRecord::RecordNotFound
        reset_session
      end
    end
    
    # ユーザ情報が取得できなかった場合は、ログインページへ
    unless @usr
      # flash[:referer] = request.fullpath
      redirect_to controller: :login, action: :index
    end
  end
  
end
