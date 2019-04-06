class ReviewsController < ApplicationController
	def create
		spot = Spot.find(params[:id])
		review = current_user.reviews.new(review_params)
		review.spot_id = spot.id
		review.user_id = current_user.id
		if review.save
			flash[:notice] = "投稿が完了しました。"
			redirect_to spot_path(spot)
		else
			flash[:warning] = "投稿ができませんでした。"
			render spot_path(spot)
		end
	end

	def destroy
		spot = Spot.find(params[:id])
		review = current_user.reviews.find_by(spot_id: spot.id)
		if review.destroy
			flash[:delete] = "投稿を削除しました。"
			redirect_to spot_path(spot)
		else
			flash[:warning] = "投稿を削除できませんでした。"
			render spot_path(spot)
		end
	end

	private

	def review_params
		params.require(:review).permit(:title, :body)
	end
end
