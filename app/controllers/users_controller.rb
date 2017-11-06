class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save

      flash[:info] = "Welcome"
      redirect_to login_path
  	else
  		render "new"
  	end

  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end



  private

  	def user_params
		  params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
  	end
end
