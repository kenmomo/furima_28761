class InformationAddress

  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :city_name, :block_number, :buildding_name, :phone_number, :information_id



  def save
    # ユーザーの情報を保存し、「user」という変数に入れている
    information = Information.create(item_id: item_id, user_id: user_id)
    # 住所の情報を保存
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city_name: city_name, block_number: block_number, building_name: building_name, phone_number: phone_number, information_id: information_id)
  end
end