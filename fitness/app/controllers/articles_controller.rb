class ArticlesController < ApplicationController
	before_action :check_user, :only => [:new, :create]

	def index
	
	end

	def new 
		if session[:is_administrator] != "forbid"
			@article = Article.new
		else
			flash[:error] = "您已被屏蔽!"
			redirect_to :controller => "homepage", :action => "index"
		end
	end

	def edit

	end

	def create
		@article = Article.new(article_params)
		@article[:author] = session[:name]

		if @article.save
			redirect_to :controller => 'homepage', :action => :index
            flash[:notice] = "发布成功~"
		else
			render :action => :new
            flash[:notice] = "请重新填写!"
		end
	end

	def update

	end

	def show
		@article = Article.find(params[:id])
		@user = User.find_by_name(@article[:author])
		
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to :controller => "homepage", :action => :index
	end

	private

	def article_params
		params.require(:article).permit(:title, :text, :author, :tag)
	end

	def check_user
		if session[:name] == nil
			flash[:warning] = "您还没有登录!"
			redirect_to :controller => 'homepage', :action => :index
		end
	end
end
