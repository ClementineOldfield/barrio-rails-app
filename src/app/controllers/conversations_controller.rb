class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    sent = Conversation.where(sender_id: current_user.id)
    received = Conversation.where(recipient_id: current_user.id)
    @conversations = (sent + received).sort_by {|c| c.messages.map{|m| m.created_at} }.reverse
    params[:conversation].present? ? @conversation = @conversations.find(params[:conversation]).first : @conversation = @conversations.first
  end

  def create
    if Conversation.between(params[:sender_id],params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id],
      params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end
    redirect_to conversation_messages_path(@conversation)
    
  end

  def change_conversation id
    @conversation = @conversations.find(id)
  end

  private

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
