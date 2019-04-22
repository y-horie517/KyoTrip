class VisitsController < ApplicationController
	before_action :check_mydata_authority, only: [:index]

  def index
  	@user = User.find(params[:user_id])
	@visits = @user.visits.order(date: "DESC", visitcount: "DESC").page(params[:page])
  end

  def create
  	spot = Spot.find(params[:spot_id])
	visit = current_user.visits.new(visit_params)
	visit.spot_id = spot.id
	# 一度訪問回数が入っていない状態でDBに登録
	if visit.save
		# なん回目の訪問か計算(過去の同スポットも検索して更新する)
		visits = current_user.visits.where(spot_id: spot.id).order(date: "ASC")
		i = 1
		visits.each do |v|
			v.visitcount = i
			v.save
			i+=1
		end

		spot.visitcount = spot.visits.select(:user_id).distinct.count
		spot.save

		flash[:notice] = "訪問履歴に追加しました。"
		redirect_to spot_path(spot)
	# バリデーションエラー時（同じ日時は登録できない）
	else
		flash[:alert] = "同じ日時に訪問済みのスポットが登録されています。"
		redirect_to spot_path(spot)
	end
  end

  def destroy
  	visit = Visit.find(params[:id])
  	# スポットを取得
  	spot_id = visit.spot_id
	@user = visit.user
	# 削除したあとに処理する。
	if visit.destroy
	# 削除したスポットより後に同じスポットが登録されたいた場合、訪問回数をすべて上書きする
		visits = current_user.visits.where(spot_id: spot_id).order(date: "ASC")
		i = 1
		visits.each do |v|
			v.visitcount = i
			v.save
			i+=1
		end
		spot = Spot.find(spot_id)
		spot.visitcount = spot.visits.select(:user_id).distinct.count
		spot.save

		flash[:notice] = "訪問履歴から削除しました。"
		redirect_back(fallback_location: user_visits_path(@user))
	else
		flash[:warning] = "削除できませんでした。"
		redirect_back(fallback_location: user_visits_path(@user))
	end
  end

  private
  def visit_params
  	params.require(:visit).permit(:date)
  end
end
