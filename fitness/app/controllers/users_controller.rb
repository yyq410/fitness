class UsersController < ApplicationController

    def index
	   @users = User.all
    end
    
    def new
	   @user = User.new
    end

    def create
	   @user = User.new(user_params)

	   if @user.save		
           redirect_to :controller => 'homepage', :action => :index
           flash[:notice] = "注册成功~"
	   else
	       render :action => :new
           flash[:notice] = "请重新注册!"
	   end
    end

    private
    def user_params
	   params.require(:user).permit(:name, :email, :password, :age, :gender)
    end
end
