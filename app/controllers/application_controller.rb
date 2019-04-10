class ApplicationController < ActionController::Base

  def require_login
    unless user_signed_in?
      flash[:warning] = "ログインしてください"
      redirect_to index_path
    end
  end

    def require_admin
    if user_signed_in?
      if (current_user.is_admin == false)
        flash[:warning] = "閲覧権限のないページが指定されたためTOPページへ遷移しました"
        redirect_to index_path
      end
    else
      flash[:warning] = "閲覧権限のないページが指定されたためTOPページへ遷移しました"
      redirect_to index_path
    end
  end

	# ユーザ登録時に指定したパラメタを登録できるようにするため
  	before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
  #strong parametersを設定し、usernameを許可
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation) }
  # devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:username, :password, :remember_me) }
  end

	def after_sign_up_path_for(resource)
  		index_path
	end

  	def after_sign_in_path_for(resource)
  		index_path
	end

	def after_sign_out_path_for(resource)
  		index_path
	end
end
