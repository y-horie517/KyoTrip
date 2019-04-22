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
	validate :reviewimages_length


	# 一覧表示のページング
	paginates_per 10

	# 投稿枚数の制限
	def reviewimages_length
		if reviewimages.attached?
			if reviewimages.length > 3
				errors[:base] << "画像の投稿数は3枚までです。"
			end
		end
	end

	def blob_is_image?
    	
  	end

	# validate :validate_img

 #  def validate_img
 #    return unless reviewimages.attached?
 #    if reviewimages.blob.byte_size > 50.megabytes
 #      reviewimages.purge
 #      errors.add(:icon, I18n.t('errors.messages.file_too_large')
 #    elsif !image?
 #      reviewimages.purge
 #      errors.add(:icon, I18n.t('errors.messages.file_type_not_image'))
 #    end
 #  end

 #  def image?
 #    %w[image/jpg image/jpeg image/gif image/png].include?(reviewimages.blob.content_type)
 #  end
end
