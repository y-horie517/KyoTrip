class FavoritesController < ApplicationController
 	def index
		@user = User.find(params[:user_id])
		@favorites = @user.favorites.reverse_order
	end

    def create
        spot = Spot.find(params[:spot_id])
        favorite = current_user.favorites.new(spot_id: spot.id)
  		favorite.save
  		redirect_to spot_path(spot)
    end

	def destroy
        favorite = Favorite.find(params[:id])
        @user = favorite.user
		if favorite.destroy
			flash[:notice] = "投稿を削除しました。"
			redirect_back(fallback_location: user_favorites_path(@user))
		else
			flash[:warning] = "投稿を削除できませんでした。"
			redirect_back(fallback_location: user_favorites_path(@user))
		end
    end
end
