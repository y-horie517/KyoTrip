class Spot < ApplicationRecord
	belongs_to :user
	belongs_to :category

	has_many :reviews, dependent: :destroy
	
	# Active Storageを用いたプロフィール画像用
	has_one_attached :spotimage

	# ユーザがお気に入りに登録しているか判定
	# def favorited_by?(user)
 #    	favorites.where(user_id: user.id).exists?
 #  	end
end
