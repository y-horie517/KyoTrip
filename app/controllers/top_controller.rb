class TopController < ApplicationController
  def index
  	render :layout => "application"
  end

  def top
  	render :layout => "top"
  end
end
