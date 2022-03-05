class Book < ApplicationRecord
  belongs_to :user
  #user model と N : 1 の関係
	validates :title, presence: true
	#titleが空白の場合エラー
	validates :body, presence: true, length: { maximum: 200 }
	#bodyが空白の場合エラー、最大200文字

end