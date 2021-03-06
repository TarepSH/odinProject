class TagsController < ApplicationController
	before_filter :require_login, only: [:destroy]

	def index
		@tag = Tag.all
	end

	def show
		@tag = Tag.find(params[:id])
	end

	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy

		#flash.notice = "Article '#{@article.title}' deleted"
		
		redirect_to tags_path
	end
end
