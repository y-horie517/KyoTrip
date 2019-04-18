class TopController < ApplicationController
  def index
    #世界遺産のスポットをIDで定義
    @heritage_group = [1,2,4,14,24,25,39,41,42,43,44,45,46,47,48,49,50]
    #世界遺産のスポットを取得
    @w_heritages = Spot.where(id: @heritage_group)

  	# 最新のレビューを５件取得
  	@reviews = Review.all.order(created_at: "DESC").limit(5)
  	render :layout => "application"
  	# render :layout => "top"
  end

  def top
  	# 最新のレビューを５件取得
  	@reviews = Review.all.order(created_at: "DESC").limit(5)
  	render :layout => "application"
  	# render :layout => "top"
  end

  def about
    render :layout => "application"
  end

end
