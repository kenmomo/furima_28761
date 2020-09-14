class InformationsController < ApplicationController

  def index 
    @information = Information.where(item_id: @items.item_id)
end

end
