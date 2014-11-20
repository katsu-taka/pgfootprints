class User < ActiveRecord::Base
  has_many :blogs
  has_one :userprofile
  
  # 各項目の入力確認
  # validates :name, presence: true, uniqueness: true
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :passwd, presence: true
  
  # ユーザ登録情報確認
  def self.authenticate(email, passwd)
    # usr = find_by(name: name)
    usr = find_by(email: email)
    # if usr != nil && usr.password == Digest::SHA1.hexdigest(password) then
    if usr != nil && usr.passwd == passwd then
      usr
    else
      return
    end
  end
  
end
