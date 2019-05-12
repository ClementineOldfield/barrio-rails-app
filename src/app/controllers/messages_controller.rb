class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipient, only: [:new]
  before_action :set_conversations, only: [:new, :create]

  def index
    @messages = @conversation.messages
    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1]
    end
    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end
    if @messages.last
      if @messages.last.user_id != current_user.id
        @messages.last.read = true;
      end
    end
    @message = @conversation.messages.new
  end

  def new
    set_conversation params[:user].to_i
    @message = @conversation.messages.new
  end

  def create
    set_conversation params[:message][:user_id].to_i
    @message = @conversation.messages.new(message_params)
    @message.update(
      user_id: params[:message][:user_id].to_i
    )
    if @message.save
      redirect_to conversations_path(@conversation)
    end
  end

  private 

  def message_params
    params.require(:message).permit(:body, :user_id)
  end

  def set_recipient
    @recipient = User.find(params[:user].to_i)
  end

  def set_conversations
    @conversations = Conversation.all
  end

  def set_conversation(user_id)
    @conversation = @conversations.find {|c| 
      ( c[:sender_id] == current_user[:id] and c[:recipient_id] == user_id ) or ( c[:sender_id] == user_id and c[:recipient_id] == current_user[:id] ) }
  end

  def message_params
    new_params = params.require(:message).permit(:body)
  end
end
