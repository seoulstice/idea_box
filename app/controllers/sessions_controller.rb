class SessionsController < ApplicationController

  def new
    @session = Session.new
  end

  def create
      @user = User.find_by(email: params[:session][:email].downcase)
      if @user && @user.authenticate(params[:session][:password])
        log_in @user
        flash[:success] = "You're now logged in, #{@user.name}."
        redirect_to user_path(@user)
      else
        flash[:danger] = "Invalid email/password combination"
        render :new
      end
    end

  def destroy
    @user = User.find_by(params[:id])
    log_out
    flash[:notice] = "You're now logged out."
    redirect_to "/"
  end
end
