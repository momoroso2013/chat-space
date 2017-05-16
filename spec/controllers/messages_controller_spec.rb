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
end

