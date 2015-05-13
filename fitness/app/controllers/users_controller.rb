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

    def show
      @user = User.find(params[:id])

      if @user == nil
        flash[:error] = "用户不存在!"
        redirect_to :controller => 'homepage', :action => :index
      end

    end

    def edit
      @user = User.find(params[:id])

      if @user == nil
        flash[:error] = "用户不存在!"
        redirect_to :controller => 'homepage', :action => :index
      end
    end

    def update
      #logger.debug "#{params}"
      @user = User.find(params[:id])

      if @user.update(user_params)
        flash[:notice] = "修改成功~"
        redirect_to :controller => 'homepage', :action => :index
      else
        flash[:error] = "修改失败！"
        render :action => :edit
      end
    end

    private
    def user_params
	   params.require(:user).permit(:name, :email, :password, :age, :gender, :avatar, :avatar_cache)
    end
end
