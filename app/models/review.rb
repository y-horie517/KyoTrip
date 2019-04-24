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
	validate :validate_reviewimg


	# 一覧表示のページング
	paginates_per 10

	# 投稿枚数の制限
	def reviewimages_length
		if reviewimages.attached?
			if reviewimages.length > 3
				errors[:reviewimages] << "画像の投稿数は3枚までです。"
			end
		end
	end

	#画像のサイズと形式のバリデーション
    def validate_reviewimg
    	return unless reviewimages.attached?

    	reviewimages.each do |reviewimage|
	    	if reviewimage.blob.byte_size > 10.megabytes
	      		reviewimage.purge
		      	errors.add(:reviewimages, I18n.t('errors.messages.file_too_large'))
		    elsif !(%w[image/jpg image/jpeg image/gif image/png].include?(reviewimage.blob.content_type))
		      	reviewimage.purge
		      	errors.add(:reviewimages, I18n.t('errors.messages.file_type_not_image'))
		    end
		end
	  end

	# ファイル形式の確認
	def image?
    	%w[image/jpg image/jpeg image/gif image/png].include?(reviewimage.blob.content_type)
  	end




  # def validate_img
  #   return unless reviewimages.attached?
  #   if reviewimages.blob.byte_size > 50.megabytes
  #     reviewimages.purge
  #     errors.add(:icon, I18n.t('errors.messages.file_too_large')
  #   elsif !image?
  #     reviewimages.purge
  #     errors.add(:icon, I18n.t('errors.messages.file_type_not_image'))
  #   end
  # end

  # def image?
  #   %w[image/jpg image/jpeg image/gif image/png].include?(reviewimages.blob.content_type)
  # end
end
