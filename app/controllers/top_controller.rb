class TopController < ApplicationController
  def index
  	render :layout => "application"
  	# render :layout => "top"
  end

  def top
  	render :layout => "top"
  end
end
