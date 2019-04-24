class Spot < ApplicationRecord
	# belongs_to :user
	belongs_to :category

	has_many :reviews, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :visits, dependent: :destroy

	# バリデーション
	validates :name, presence: true
	# validates :category_id, presence: true
	validate :validate_spotimg

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


  	#画像のサイズと形式のバリデーション
    def validate_spotimg
    	return unless spotimage.attached?

    	if spotimage.blob.byte_size > 10.megabytes
      		spotimage.purge
	      	errors.add(:spotimage, I18n.t('errors.messages.file_too_large'))
	    elsif !image?
	      	spotimage.purge
	      	errors.add(:spotimage, I18n.t('errors.messages.file_type_not_image'))
	    end
	  end
	# ファイル形式の確認
	def image?
    	%w[image/jpg image/jpeg image/gif image/png].include?(spotimage.blob.content_type)
  	end
end
