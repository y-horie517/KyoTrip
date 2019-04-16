# lib/custom_failure.rb[new]
class CustomFailure < Devise::FailureApp
  def redirect_url
    root_url # 遷移先
  end

  def respond
    if http_auth?
      http_auth
    else
      redirect
    end
  end
end