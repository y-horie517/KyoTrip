class FavoritesController < ApplicationController
    before_action :check_mydata_authority, only: [:index]

 	def index
		@user = User.find(params[:user_id])
		@favorites = @user.favorites.reverse_order.page(params[:page])
	end

    def create
        @spot = Spot.find(params[:spot_id])
        @user = current_user
        favorite = @user.favorites.new(spot_id: @spot.id)
  		if favorite.save
            @spot.favoritecount = @spot.favorites.count
            @spot.save


        end
  		# redirect_back(fallback_location: user_favorites_path(@user))
    end

	def destroy
        # if params[:spot_id].nil?
        # 	id = params[:id]
        # else
        # 	id = params[:spot_id]
        # end

        @spot = Spot.find(params[:spot_id])
        @user = current_user
        favorite = @user.favorites.find_by(spot_id: @spot.id)
		if favorite.destroy
            @spot.favoritecount = @spot.favorites.count
            @spot.save
        end
    end

    # お気に入り一覧画面での削除
    def mypagedestroy
        @spot = Spot.find(params[:id])
        @user = current_user
        favorite = @user.favorites.find_by(spot_id: @spot.id)
        if favorite.destroy
            @spot.favoritecount = @spot.favorites.count
            @spot.save
            flash[:notice] = "お気に入りを解除しました。"
            redirect_back(fallback_location: user_favorites_path(@user))
        end
    end
end
