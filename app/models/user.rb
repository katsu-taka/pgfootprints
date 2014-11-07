class User < ActiveRecord::Base
  validates :name, presence: { message: '名前blank?' }
end
