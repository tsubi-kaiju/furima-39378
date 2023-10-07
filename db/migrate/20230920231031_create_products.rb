class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references  :user,                    null: false, foreign_key: true
      t.string      :name,                    null: false
      t.text        :description,             null: false
      t.integer     :price,                   null: false
      t.integer     :category_id,             null: false
      t.integer     :condition_id,            null: false
      t.integer     :shipping_fee_bearer_id,  null: false
      t.integer     :shipping_origin_id,      null: false
      t.integer     :shipping_duration_id,    null: false
      t.timestamps
    end
  end
end
