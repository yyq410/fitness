class ArticlesController < ApplicationController
	
	def index
	
	end

	def new 
		if session[:name] != nil
			@article = Article.new

		else
			flash[:warning] = "您还没有登录!"
			redirect_to :controller => 'homepage', :action => :index
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

	private

	def article_params
		params.require(:article).permit(:title, :text, :author)
	end
end
