class LoginController < ApplicationController
  before_action :new_act
  
  def index
  end
  
  private
    # 新規作成
    def new_act
      @user = User.new
    end
end
