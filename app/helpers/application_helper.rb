module ApplicationHelper
  
  # カレントユーザ取得
  def current_user
      @current_user ||= User.find_by(id: session[:usr])
    end
end
