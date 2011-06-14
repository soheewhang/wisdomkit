class UsersController < ApplicationController

before_filter :authenticate, :only => [:index, :edit, :update, :destroy, :show]
before_filter :correct_user, :only => [:edit, :update]
before_filter :admin_user, :only => [:destroy]
before_filter :non_signed_in_user_only, :only => [:create]
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
end
