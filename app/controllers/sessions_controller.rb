class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate
      log_in user
      redirect_to root_url
    else
      flash.now[:danger] = 'メールアドレスとパスワードの組み合わせが間違っています'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
                    