class Review < ApplicationRecord
	belongs_to :user
	belongs_to :spot
	validates :title, presence: true
	validates :title, length: { maximum: 30 }
  	validates :body, presence: true
  	validates :body, length: { maximum: 300 }
end
