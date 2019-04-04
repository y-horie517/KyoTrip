class User < ApplicationRecord
	# Active Storageを用いたプロフィール画像用
	has_one_attached :userimage
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
