class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  # ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 }

  belongs_to_active_hash :condition

  # ジャンルの選択が「--」の時は保存できないようにする
  validates :condition_id, numericality: { other_than: 1 }

  belongs_to_active_hash :delivery_burden

  # ジャンルの選択が「--」の時は保存できないようにする
  validates :delivery_burden_id, numericality: { other_than: 1 }

  belongs_to_active_hash :delivery_area

  # ジャンルの選択が「--」の時は保存できないようにする
  validates :delivery_area_id, numericality: { other_than: 1 }

  belongs_to_active_hash :delivery_days

  # ジャンルの選択が「--」の時は保存できないようにする
  validates :delivery_days_id, numericality: { other_than: 1 }

  validates :item_name, :image, :content, :category_id, :condition_id, :price, :delivery_burden_id, :delivery_area_id, :delivery_days_id, presence: true

  belongs_to :user

  with_options presence: true do
    validates :item_name
    validates :image
    validates :content
    validates :category_id
    validates :condition_id
    validates :price
    validates :delivery_burden_id
    validates :delivery_area_id
    validates :delivery_days_id
  end

  validates :price, numericality: { only_integer: true }
  validates :price, numericality: { greater_than_or_equal_to: 300 }
  validates :price, numericality: { less_than_or_equal_to: 9_999_999 }

  has_one_attached :image

  validates :price, format: { with: /\A[0-9]+\z/ }

  has_one :information
end
