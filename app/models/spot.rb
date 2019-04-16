class Spot < ApplicationRecord
	# belongs_to :user
	belongs_to :category

	has_many :reviews, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :visits, dependent: :destroy

	# バリデーション
	validates :name, presence: true

	# Active Storageを用いた画像投稿用
	has_one_attached :spotimage

	# 一覧表示のページング
	paginates_per 10

	# ユーザがお気に入りに登録しているか判定
	def favorited_by?(user)
    	favorites.where(user_id: user.id).exists?
  	end

  	# ユーザが訪れたことがあるか判定
	def visited_by?(user)
    	visits.where(user_id: user.id).exists?
  	end
end
