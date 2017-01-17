class GroupsController < ApplicationController
  def new
    @client = Client.find(params[:client_id])
    @group = Group.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def group_params
      params.require(:group).permit(:name, :client_id)
    end
end
