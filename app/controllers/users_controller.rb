class UsersController < ApplicationController
  def index
  end
  def show
  	@user = User.find_by(_id: params[:id])
  end
end
