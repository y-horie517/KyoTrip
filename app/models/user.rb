class User < ApplicationRecord
	# ユーザが消えても投稿したスポットは消えないようにする。
	has_many :spots
	# レビューはユーザと一緒に消えて良い
	has_many :reviews, dependent: :destroy
	has_many :favorites, dependent: :destroy

	# Active Storageを用いたプロフィール画像用
	has_one_attached :userimage
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
