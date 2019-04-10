class SpotsController < ApplicationController

  def index
    @search = Spot.ransack(params[:q]) #ransackメソッド推奨
  	@spots = @search.result.page(params[:page])
    if user_signed_in?
      @user = current_user
    end
  end

  def new
  	@spot = Spot.new
  end

  def create
  	spot = Spot.new(spot_params)
  	spot.user_id = current_user.id
  	# DBへ保存する
    if spot.save
     	flash[:notice] = "スポットが1件登録されました。"
     	redirect_to spot_path(spot.id)
    else
     	flash[:warning] = "スポットの登録に失敗しました。未入力の項目があります。"
     	render new_spot_path(spot.id)
    end
  end

  def show
  	@spot = Spot.find(params[:id])
    # ユーザ情報を紐付ける
    @review  = @spot.reviews.build(user_id: current_user.id)
    @reviews = @spot.reviews.all.reverse_order
    @favorite  = @spot.favorites.build(user_id: current_user.id)
    @visit = @spot.visits.build(user_id: current_user.id)
  end

  def edit
  	@spot = Spot.find(params[:id])
  end

  def update
  	spot = Spot.find(params[:id])
  	# DBへ保存する
    if spot.update(spot_params)
     	flash[:notice] = "情報が更新されました。"
     	redirect_to spot_path(spot.id)
    else
     	flash[:warning] = "情報の更新に失敗しました。未入力の項目があります。"
     	render edit_spot_path(spot.id)
    end
  end


  private
  def spot_params
  	params.require(:spot).permit(:name, :description, :address, :url, :category_id, :spotimage)
  end
end
