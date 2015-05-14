class HomepageController < ApplicationController
    def index
    	@articles = Article.all

    end

    def check
    	@user = User.find_by_name(params[:name])

    	if @user != nil && @user[:password] == params[:password]
    		session[:name] = @user[:name]
    		flash[:notice] = "登录成功~"
    	else
    		flash[:error] = "用户名或密码错误!"
    	end

    	redirect_to :action => :index
    end

    def logout
        session[:name] = nil

        redirect_to :action => :index
    end

end
