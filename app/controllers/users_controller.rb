class UsersController < ApplicationController
  before_action :check_mypage_authority, only: [:show]
  before_action :require_admin, only: [:index]

  def index
    # 管理者以外表示
    # @users = User.where(is_admin: false)
    @users = User.all
  end

  def show
  	@user = User.find(params[:id])
    @review = Review.new
    # カテゴリ名の配列を取得
    @category_names = Category.all.pluck(:category_name)

    # 重複無しで訪問済みのスポットIDを配列で取得
    @visits = @user.visits.pluck(:spot_id).uniq
    # 各カテゴリの訪問回数を保存する配列を用意(ID順)
    @visitcategory = Array.new(Category.count, 0)
    # 訪問済みスポットの数だけ回す

    i = 0
    @visits.each do |v|
      # カウントを+１する対象のIDを設定
      id = Spot.find(v).category_id - 1
      @visitcategory[id] += 1
    end
  end

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

    # マイページへのアクセス権チェック
  def check_mypage_authority
    if user_signed_in?
      # マイページのユーザ
      user = User.find(params[:id])
      if ((current_user != user)&&(current_user.is_admin == false))
        flash[:warning] = "閲覧権限のないページが指定されたためTOPページへ遷移しました"
        redirect_to index_path
      end
    else
      flash[:warning] = "ログインしてください"
      redirect_to index_path
    end
  end
end
