class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :item_name          , null: false
      t.text    :content            , null: false
      t.integer :category_id        , null: false
      t.integer :condition_id       , null: false
      t.integer :price              , null: false
      t.integer :delivery_burden_id , null: false
      t.integer :delivery_area_id   , null: false
      t.integer :delivery_days_id   , null: false 
      t.integer :user_id            , null: false, foreign_key: true
      t.timestamps
    end
  end
end
