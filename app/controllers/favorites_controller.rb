class FavoritesController < ApplicationController
 	def index
		@user = User.find(params[:user_id])
		@favorites = @user.favorites.reverse_order
	end

    def create
        spot = Spot.find(params[:spot_id])
        @user = current_user
        favorite = @user.favorites.new(spot_id: spot.id)
  		favorite.save
  		redirect_back(fallback_location: user_favorites_path(@user))
    end

	def destroy
        # favorite = Favorite.find(params[:id])
        # @user = favorite.user
        if params[:spot_id].nil?
        	id = params[:id]
        else
        	id = params[:spot_id]
        end

        spot = Spot.find(id)
        @user = current_user
        favorite = @user.favorites.find_by(spot_id: spot.id)

		if favorite.destroy
			flash[:notice] = "お気に入りを解除しました。"
			redirect_back(fallback_location: user_favorites_path(@user))
		else
			flash[:warning] = "お気に入りを解除できませんでした。"
			redirect_back(fallback_location: user_favorites_path(@user))
		end
    end
end
