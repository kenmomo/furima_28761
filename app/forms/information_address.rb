class InformationAddress

  include ActiveModel::Model
  attr_accessor :token, :item_id, :user_id, :postal_code, :prefecture_id, :city_name, :block_number, :buildding_name, :phone_number, :information_id

  with_options presence: true do
    validates :postal_code
    validates :city_name
    validates :block_number
    validates :phone_number
  end

  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
  validates :phone_number, length: { maximum: 11 }
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :token, presence: true

  def save
    # ユーザーの情報を保存し、「user」という変数に入れている
    information = Information.create(item_id: item_id, user_id: user_id)
    
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city_name: city_name, block_number: block_number, buildding_name: buildding_name, phone_number: phone_number, information_id: information.id)
  end
end