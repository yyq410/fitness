class CommentsController < ApplicationController
	before_action :check_user, :only => [:create]

	def create
		@article = Article.find(params[:article_id])
		comment = comment_params
		comment[:commenter] = session[:name]
		@comment = @article.comments.create(comment)

		redirect_to article_path(@article)
	end

	private
	def comment_params
		params.require(:comment).permit(:commenter, :body, :title)
	end

	def check_user
		if session[:name] == nil
			flash[:warning] = "您还没有登录!"
			redirect_to :controller => 'homepage', :action => :index
		end
	end
end
