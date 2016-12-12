class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    @user.email = session[:auth]['info']['email']
    @user.oauth_uid = session[:auth]['uid']
    if @user.save
      session[:auth].clear
      session[:user_id] = @user.id
      @user.touch :last_signed_in_at
      @user.increment! :sign_in_count
      flash[:success] = 'Registered successfully'
      redirect_to root_path
    else
      flash[:alert] = 'There was a problem registering'
      render :new
    end
  end

  def new
    @user = User.new(email: @user.)
  end

end
