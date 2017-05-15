class MessagesController < ApplicationController

before_action :find_group, only: [:index, :create]

def index
  @message = Message.new
  @groups = current_user.groups.order("id DESC")
end

def create
  @message = current_user.messages.new(message_params)
  if @message.save
    redirect_to group_messages_path, notice: "メッセージを送信しました。"
  else
    flash.now[:alert] = "メッセージを入力してください。"
    render :index
  end
end

private

def find_group
  @group = Group.find(params[:group_id])
end

def message_params
  params.require(:message).permit(:text).merge(group_id: params[:group_id])
end

end
