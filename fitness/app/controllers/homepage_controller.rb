class HomepageController < ApplicationController
    def index
    	@articles = Article.all

    end

    def check
    	@user = User.find_by_name(params[:name])

    	if @user != nil && @user[:password] == params[:password]
    		session[:name] = @user[:name]
            session[:is_administrator] = @user[:is_administrator]
    		flash[:notice] = "登录成功~"
    	else
    		flash[:error] = "用户名或密码错误!"
    	end

    	redirect_to :action => :index
    end

    def search
        content = params[:search]
        @articles = Article.all

        length = @articles.length
        @flag = Array.new(length)
        for i in 0...length
            per_title = @articles[i][:title]
            per_text = @articles[i][:text]
            per_author = @articles[i][:author]

            @flag[i] = per_title.include?(content) || per_text.include?(content) || per_author.include?(content)
        end

        flash[:notice] = "包含 " + content + " 的帖子: " 
    end

    def notice
        @articles = Article.where(tag: "notice")

    end
    
    def logout
        session[:name] = nil
        session[:is_administrator] = nil

        redirect_to :action => :index
    end

end
