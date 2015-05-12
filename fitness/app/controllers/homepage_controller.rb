class HomepageController < ApplicationController
    def index
    	
    end

    def check
    	@user = User.find_by_name(params[:name])

    	if @user != nil && @user[:password] == params[:password]
    		session[:user_id] = @user[:name]
    		flash[:notice] = "登录成功~"
    	else
    		flash[:error] = "用户名或密码错误!"
    	end

    	redirect_to :action => :index
    end

end
