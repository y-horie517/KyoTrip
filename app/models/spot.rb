class Spot < ApplicationRecord
	belongs_to :user
	belongs_to :category

	has_many :reviews, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :visits, dependent: :destroy

	# Active Storageを用いた画像投稿用
	has_one_attached :spotimage

	# ユーザがお気に入りに登録しているか判定
	def favorited_by?(user)
    	favorites.where(user_id: user.id).exists?
  	end
end
