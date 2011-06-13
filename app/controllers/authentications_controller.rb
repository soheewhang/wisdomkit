#encoding:UTF-8
class AuthenticationsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(auth['provider'], auth['uid'])
    if authentication
      sign_in authentication.user
      redirect_to root_path
    elsif current_user
      current_user.authentications.create(:provider => auth['provider'], :uid => auth['uid'], 
                                          :token => auth['credentials']['token'], :nickname => auth['user_info']['nickname'])
      redirect_back_or user_path(current_user)
    else
      session[:avatar_url] = auth['user_info']['image']
      session[:omniauth] = auth.except('extra')
      session[:name] = auth["user_info"]["name"]
      if auth['provider'] == 'facebook'
        session[:email] = auth['user_info']['email']
        birthday = auth['extra']['user_hash']['birthday']
        if birthday
          session[:birthday] = Date.strptime(birthday, "%m/%d/%Y")
        end
      end
      redirect_back_or root_path
    end
  end
  
  def apply_omniauth(omniauth)
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    redirect_back_or user_path(current_user)
  end
end
