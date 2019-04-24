class ReviewsController < ApplicationController
	before_action :check_mydata_authority, only: [:index]
	# ユーザごとの投稿一覧
	def index
		@user = User.find(params[:user_id])
		@reviews = @user.reviews.reverse_order.page(params[:page])
	end

	def create
		@spot = Spot.find(params[:spot_id])
		@review = current_user.reviews.new(review_params)
		@review.spot_id = @spot.id
		if @review.save
			@spot.reviewcount = @spot.reviews.count
			@spot.save
			flash[:notice] = "投稿が完了しました。"
			redirect_back(fallback_location: spot_path(@spot))
		else
      		flash[:alert] = @review.errors.full_messages
			redirect_back(fallback_location: spot_path(@spot))
		end
	end

	def destroy
		review = Review.find(params[:id])
		spot = Spot.find(review.spot_id)
		@user = review.user
		if review.destroy
			spot.reviewcount = spot.reviews.count
			spot.save
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
