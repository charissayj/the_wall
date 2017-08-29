class CommentsController < ApplicationController
	def create
		@comment = Comment.new(comment_params)
		@comment.user = current_user
		@comment.message = Message.find(params[:id])

		if @comment.save
			flash["notice"] = ["comment created"]
			return redirect_to "/messages"
		end

		flash[:errors] = @comment.errors.full_messages

		return redirect_to :back
	end

	private
		def comment_params
			params.require(:comment).permit(:content)
		end
end
