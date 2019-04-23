class User < ApplicationRecord
	# ユーザが消えても投稿したスポットは消えないようにする。
	# has_many :spots
	
	# レビューはユーザと一緒に消えて良い
	has_many :reviews, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :visits, dependent: :destroy

	# Active Storageを用いたプロフィール画像用
	has_one_attached :userimage
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :validatable

	validates :username, presence: true
    validate :validate_prof

    def validate_prof
    	return unless userimage.attached?

    	if userimage.blob.byte_size > 10.megabytes
      		userimage.purge
	      	errors.add(:userimage, I18n.t('errors.messages.file_too_large'))
	    elsif !image?
	      	userimage.purge
	      	errors.add(:userimage, I18n.t('errors.messages.file_type_not_image'))
	    end
	  end

	def image?
    	%w[image/jpg image/jpeg image/gif image/png].include?(userimage.blob.content_type)
  	end
end

