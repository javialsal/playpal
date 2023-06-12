class MessagesController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @message = Message.new(message_params)
    @message.chatroom = @game.chatroom
    @message.user = current_user
    if @message.save
      ChatroomChannel.broadcast_to(
        @game.chatroom,
        render_to_string(partial: "shared/message", locals: {message: @message})
      )
      head :ok
    else
      render "game_path", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
