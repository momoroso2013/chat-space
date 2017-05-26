class GroupsController < ApplicationController

before_action :index_variables, only: [:edit, :update]

  def index
    @groups = current_user.groups.order('id DESC')
  end

  def new
    @group = Group.new
  end

  def create
  @group = Group.new(group_params)
    if @group.save
      redirect_to :root, notice: 'グループを作成しました。'
    else
      render :new
    end
  end

  def edit
    index_variables
  end

  def update
    index_variables
    if @group.update(group_params)
      redirect_to :root, notice: "グループを編集しました"
    else
      render :new
  end
  end


  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def index_variables
    @group = Group.find(params[:id])
  end
end
