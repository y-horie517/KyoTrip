class Spot < ApplicationRecord
	belongs_to :user
	belongs_to :category

	# Active Storageを用いたプロフィール画像用
	has_one_attached :spotimage
end
