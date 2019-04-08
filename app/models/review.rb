class Review < ApplicationRecord
	belongs_to :user
	belongs_to :spot
	
	# バリデーション
	validates :title, presence: true
	validates :title, length: { maximum: 30 }
  	validates :body, presence: true
  	validates :body, length: { maximum: 300 }

  	# Active Storageを用いた画像投稿用(複数枚)
	has_many_attached :reviewimages
end
