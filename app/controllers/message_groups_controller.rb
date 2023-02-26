class MessageGroupsController < ApplicationController
  def index
    @current_user = current_user
    redirect_to '/signin' unless @current_user

    @message_groups = MessageGroup.all
    @users = User.excluding(@current_user)
    @message_group = MessageGroup.new
    @message = Message.new
  end

  def show
    @current_user = current_user
    @message_group = MessageGroup.find(params[:id])
    @message_groups = MessageGroup.all
    @users = User.excluding(@current_user)
    @message = Message.new
    @messages = @message_group.messages
  end

  def create
    @message_group = MessageGroup.create(name: params["message_group"]["name"])
  end
end
