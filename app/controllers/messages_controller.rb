class MessagesController < ApplicationController
	def index
		@messages = Message.order(created_at: :desc)
	end

	def create
		@message = Message.new(message_params)
		@message.user = current_user

		if @message.save
			flash["notice"] = ["Message created"]
			return redirect_to "/messages"
		end

		flash[:errors] = @message.errors.full_messages

		return redirect_to :back
	end

	private
		def message_params
			params.require(:message).permit(:content)
		end
end
