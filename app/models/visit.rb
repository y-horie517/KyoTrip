class Visit < ApplicationRecord
	belongs_to :user
	belongs_to :spot


	validates :date, uniqueness: true

	# 一覧表示のページング
	paginates_per 10
end
