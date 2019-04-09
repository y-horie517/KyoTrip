class ReviewsController < ApplicationController
	# ユーザごとの投稿一覧
	def index
		@user = User.find(params[:user_id])
		@reviews = @user.reviews.reverse_order
	end

	def create
		spot = Spot.find(params[:spot_id])
		review = current_user.reviews.new(review_params)
		review.spot_id = spot.id
		if review.save
			flash[:notice] = "投稿が完了しました。"
			redirect_back(fallback_location: spot_path(spot))
		else
			flash[:warning] = "投稿ができませんでした。"
			redirect_back(fallback_location: spot_path(spot))
		end
	end

	def destroy
		review = Review.find(params[:id])
		@user = review.user
		if review.destroy
			flash[:notice] = "投稿を削除しました。"
			redirect_back(fallback_location: user_reviews_path(@user))
		else
			flash[:warning] = "投稿を削除できませんでした。"
			redirect_back(fallback_location: user_reviews_path(@user))
		end
	end

	private

	def review_params
		# active storageで複数枚画像を登録する際の書き方
		params.require(:review).permit(:title, :body, reviewimages: [])
	end
end
