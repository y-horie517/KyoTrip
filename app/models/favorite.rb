class Favorite < ApplicationRecord
	belongs_to :user
 	belongs_to :spot

 	# 一覧表示のページング
	paginates_per 21
end
