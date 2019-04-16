# lib/custom_failure.rb[new]
class CustomFailure < Devise::FailureApp
  def redirect_url
    index_url # 遷移先
  end

  def respond
    if http_auth?
      http_auth
    else
       flash[:warning] = "ログインに失敗しました。"
      redirect
    end
  end
end