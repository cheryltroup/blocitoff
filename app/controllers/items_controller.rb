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
  
  private

  def item_params
  	params.require(:item).permit(:name)
  end

end
