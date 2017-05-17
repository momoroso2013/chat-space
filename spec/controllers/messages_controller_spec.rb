require 'rails_helper'

describe MessagesController do
  describe "GET #index" do
    let(:user)  { create(:user) }
    let(:group) { create(:group) }
    let(:messages) { create_list(:message, 3, group: group, user: user) }
    context "when user has already signed in" do
      before do
        login_user user
        get :index, group_id: group.id
      end

      it "renders the :index template" do
        expect(response).to render_template :index
      end

      it "assigns the requested message to @message" do
        expect(assigns(:message)).to be_a_new(Message)
      end

      it "populates an array of messages ordered by created_at DESC" do
        expect(assigns(:messages)).to match(messages)
      end

      it "assigns the requested contact to @groups" do
        group = user.groups.first
        groups = user.groups
        expect(assigns(:groups)).to eq groups
      end

    end

    context "when user has NOT signed in" do
      it "redirect_to new_user_session_path" do
        get :index, group_id: group.id
        expect(response).to redirect_to (new_user_session_path)
      end
    end
  end

  describe "POST #create" do
    let(:user)  { create(:user) }
    let(:group) { create(:group) }
    let(:message) { create(:message, group: group, user: user) }
    let(:message_params) do {message: {text: message.text}, group_id: group.id}
    end
    let(:message_empty_params) do {message: {text: ""}, group_id: group.id}
    end

    before do
      login_user user
    end

    context "when message saved" do
      before do
        post :create, message_params
      end

      it "renders the :create template" do
        expect(response).to redirect_to (group_messages_path)
      end

      it "create flash message" do
        expect(flash.now[:notice]).to match("メッセージを送信しました。")
      end
    end

    context "when message CAN'T saved" do
      before do
        post :create, message_empty_params
      end

      it "renders the :index template" do
        expect(response).to render_template :index
      end

      it "create flash message" do
        expect(flash.now[:alert]).to match("メッセージを入力してください。")
      end
    end

      it "assigns the requested message to @message" do
        expect{assigns(:message)}.to change(Message, :count).by(0)
      end
  end
end
