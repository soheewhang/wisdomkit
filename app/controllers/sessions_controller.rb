#encoding:UTF-8
class SessionsController < ApplicationController
  
  def create
    user = User.authenticate(params[:session][:email], params[:session][:password])
    if user.nil?
      # logger.error "[SIGNIN ERR] failed signing in for #{params[:session][:email]}"
      flash.now[:error] = "이메일과 비밀번호를 확인해주세요."
      render 'new'
    else
      # logger.debug user
      sign_in user
      redirect_to root_path
    end
  end
  
  
  def destroy
    sign_out
    redirect_to root_path
  end
  
end
