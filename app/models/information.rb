class Information < ApplicationRecord


 belongs_to :user
 belongs_to :item
 has_one :address


 belongs_to_active_hash :prefecture

 # ジャンルの選択が「--」の時は保存できないようにする
 validates :prefecture_id, numericality: { other_than: 1 }


end
