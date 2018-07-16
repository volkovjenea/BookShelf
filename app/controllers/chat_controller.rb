class ChatController < ApplicationController
  def show
    @messages = Message.all
  end

  def destroy
    @message = Message.find(params[:message_id])
    @message.destroy
    redirect_to chat_show_path

  end
end
