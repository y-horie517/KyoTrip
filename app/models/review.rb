class Review < ApplicationRecord
	belongs_to :user
	belongs_to :spot
	validates :title, length: { maximum: 30 }
  	validates :body, presence: true, length: { maximum: 300 }
end
