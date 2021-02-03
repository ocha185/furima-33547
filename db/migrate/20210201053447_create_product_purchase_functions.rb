class CreateProductPurchaseFunctions < ActiveRecord::Migration[6.0]
  def change
    create_table :product_purchase_functions do |t|
      t.string :post_code,            null: false
      t.integer :prefecture_id,            null: false
      t.string :city,            null: false
      t.string :address,            null: false
      t.string :building_name
      t.string :phone_number,            null: false
      t.references :buyer_history,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
