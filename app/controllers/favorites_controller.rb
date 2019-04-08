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
        spot = Spot.find(params[:spot_id])
        favorite = current_user.favorites.find_by(spot_id: spot.id)
        favorite.destroy
        redirect_to spot_path(spot)
    end
end
