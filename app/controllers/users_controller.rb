class UsersController < ApplicationController
  def index
  end

  def show
  	@user = User.find(params[:id])
    @review = Review.new
  end

  # def edit
  # 	@user = User.find(params[:id])

  # end

  def update
   	user = User.find(params[:id])
  	if user.update(user_params)
      flash[:notice] = 'ユーザ情報が更新されました。'
      redirect_to user_path(user.id)
    else
      flash[:warning] = 'ユーザ情報の更新に失敗しました。'
	  redirect_to user_path(user.id)
    end
  end

  private

	def user_params
		params.require(:user).permit(:username, :userimage)
	end
end
