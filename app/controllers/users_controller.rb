class UsersController < ApplicationController
  def show
  	@user = current_user
  	@items = @user.items
  	@item = Item.new
  end

  def crap
  	@items = current_user.items
  end
end