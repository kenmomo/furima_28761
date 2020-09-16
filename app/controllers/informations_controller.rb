class InformationsController < ApplicationController
  before_action :set_item, only: [:show, :index]

  def index 

  end

  def new
    @information = InformationAddress.new
    @address = @information.addresses.new
  end

  def create
    @information = InformationAddress.new(information_params)
    if @information.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def show
    @information = Information.new
    @information = @item.information.includes(:user)
  end
 # 他のコントローラーと同様に@itemの定義をしましょう
 # ミニアプリ参考にして進める



 private

 def information_params
  params.require(:information).permit(:item_id, :user_id, addresses_attributes: [:postal_code, :prefecture_id, :city_name, :block_number, :buildding_name, :phone_number, :_destroy, :id])
 end

 def set_item
  @item = Item.find(params[:item_id])
 end

end