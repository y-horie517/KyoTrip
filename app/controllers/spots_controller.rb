class SpotsController < ApplicationController

  def index
    @search = Spot.ransack(params[:q]) #ransackメソッド推奨
    # @search = Spot.ransack(params.fetch(:q, category_id_eq: 2))
  	@spots = @search.result.page(params[:page])
    if user_signed_in?
      @user = current_user
    end
  end

  def new
  	@spot = Spot.new
  end

  def create
  	@spot = Spot.new(spot_params)
  	@spot.user_id = current_user.id

    # area_idを付与
    if @spot.address.match?(/上京区|中京区|下京区/)
      @spot.area_id = 1
    elsif @spot.address.match?(/北山区/)
      @spot.area_id = 2
    elsif @spot.address.match?(/左京区|東山区|山科区/)
      @spot.area_id = 3
    elsif @spot.address.match?(/右京区|西京区/)
      @spot.area_id = 4
    elsif @spot.address.match?(/南区|伏見区/)
      @spot.area_id = 5
    # 京都市という文字列がない場合は市外と判断
    elsif !@spot.address.match?(/京都市/)
      @spot.area_id = 6
    # 住所未入力の場合
    else
      # その他を念のため用意
      @spot.area_id = 7
    end

  	# DBへ保存する
    if @spot.save
     	flash[:notice] = "スポットが1件登録されました。"
     	redirect_to spot_path(@spot.id)
    else
      # @spot = Spot.new(spot_params)
     	render "spots/new"
    end
  end

  def show
  	@spot = Spot.find(params[:id])
    # ユーザ情報を紐付ける
    if user_signed_in?
      @review  = @spot.reviews.build(user_id: current_user.id)
      @favorite  = @spot.favorites.build(user_id: current_user.id)
      @visit = @spot.visits.build(user_id: current_user.id)
    end
    @reviews = @spot.reviews.all.reverse_order.page(params[:page])
  end


  def edit
  	@spot = Spot.find(params[:id])
  end


  def update
  	@spot = Spot.find(params[:id])
    # area_idを付与
    if @spot.address.match?(/上京区|中京区|下京区/)
      @spot.area_id = 1
    elsif @spot.address.match?(/北山区/)
      @spot.area_id = 2
    elsif @spot.address.match?(/左京区|東山区|山科区/)
      @spot.area_id = 3
    elsif @spot.address.match?(/右京区|西京区/)
      @spot.area_id = 4
    elsif @spot.address.match?(/南区|伏見区/)
      @spot.area_id = 5
    # 京都市という文字列がない場合は市外と判断
    elsif !@spot.address.match?(/京都市/)
      @spot.area_id = 6
    # 住所未入力の場合
    else
      # その他を念のため用意
      @spot.area_id = 7
    end
  	# DBへ保存する
    if @spot.update(spot_params)
     	flash[:notice] = "情報が更新されました。"
     	redirect_to spot_path(@spot.id)
    else
     	# flash[:warning] = "情報の更新に失敗しました。未入力の項目があります。"
     	render 'spots/edit'
    end
  end

  def destroy
    spot = Spot.find(params[:id])
    if spot.destroy
      flash[:notice] = "スポットを削除しました。"
      redirect_to spots_path
    else
      flash[:warning] = "スポットの削除に失敗しました。"
      render edit_spot_paths
    end
  end


  private
  def spot_params
  	params.require(:spot).permit(:name, :description, :address, :url, :category_id, :mapid, :spotimage)
  end
end
