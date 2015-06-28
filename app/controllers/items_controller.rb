class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
  end

def create
    @item = current_user.items.build(item_params)
    
    if @item.save
    
      flash[:notice] = "A New Item has been created."
       render 'items/show'
       #render 'items/create'
    else
      flash[:error]= "Error creating Item, Please try again. "
      render 'users/show'
  end
end

def destroy
  @item = Item.find(params[:id])
  @user = @item.user

  if @item.destroy
    flash[:notice] = "Item was removed."  
  else
    flash[:error] = "Item could not be deleted. Try again."
  end

  respond_to do |format|
    format.html
    format.js
  end
end


  
  private

  def item_params
  	params.require(:item).permit(:name)
  end
end
