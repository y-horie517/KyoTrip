class SpotsController < ApplicationController
  def index
  	@spots = Spot.all
  end

  def new
  	@spot = Spot.new
  end

  def create
  	spot = Spot.new(spot_params)
  	spot.user_id = current_user.id
  	# DBへ保存する
    if spot.save!
     	flash[:notice] = "スポットが1件登録されました。"
     	redirect_to spot_path(spot.id)
    else
     	flash[:warning] = "スポットの登録に失敗しました。未入力の項目があります。"
     	render new_spot_path
    end
  end

  def show
  	@spot = Spot.find(params[:id])
  end


  private
  def spot_params
  	params.require(:spot).permit(:name, :description, :address, :url, :category_id, :spotimage)
  end
end
