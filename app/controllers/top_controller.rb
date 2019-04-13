class TopController < ApplicationController
  def index
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
