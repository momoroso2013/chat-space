class MessagesController < ApplicationController

before_action :group_find


def index
  @message = Message.new
  @groups = current_user.groups.order("id DESC")
  group_find
end

def create
  @message = current_user.messages.new(message_params)
  group_find
  if @message.save
    redirect_to group_messages_path, notice: "メッセージを送信しました。"
  else
    flash.now[:alert] = "メッセージを入力してください。"
    render :index
  end
end

private

def group_find
    @group = Group.find(params[:group_id])

end

def message_params
  params.require(:message).permit(:text).merge(group_id: params[:group_id], user_id: current_user.id)
end

end
