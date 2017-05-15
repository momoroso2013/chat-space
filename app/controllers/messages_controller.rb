class MessagesController < ApplicationController

def index
  @message = Message.new
  @groups = current_user.groups.order("id DESC")
  @group = Group.find(params[:group_id])
end

def create
  Message.create(text: message_params[:text], image:message_params[:image], group_id: message_params[:group_id],user_id: message_params[:user_id])
  redirect_to group_messages_path
end

private

def message_params
  params.require(:message).permit(:text).merge(group_id: params[:group_id], user_id: current_user.id)
end

end
