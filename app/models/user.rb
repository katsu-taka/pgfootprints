class User < ActiveRecord::Base
  # 各項目の入力確認
  validates :name, presence: true, uniqueness: true
  validates :email, presence:true
  validates :passwd, presence:true
  
  # ユーザ登録情報確認
  def self.authenticate(name, passwd)
    usr = find_by(name: name)
    # if usr != nil && usr.password == Digest::SHA1.hexdigest(password) then
    if usr != nil && usr.passwd == passwd then
      usr
    else
      return
    end
  end
  
end
