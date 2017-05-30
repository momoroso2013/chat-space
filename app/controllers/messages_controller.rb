class MessagesController < ApplicationController

before_action :find_group, only: [:index, :create]

def index
  @message = Message.new
  @messages = @group.messages.includes(:user)
  @groups = current_user.groups.order("id DESC")
  respond_to do |format|
    format.html
    format.json
  end
end

def create
  @message = current_user.messages.new(message_params)
  if @message.save
    respond_to do |format|
      format.json
    end
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
  params.require(:message).permit(:text, :image).merge(group_id: params[:group_id])
end

end
