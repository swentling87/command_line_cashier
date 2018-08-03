class CreateItemPromo < ActiveRecord::Migration[5.2]
  def change
    create_table :item_promos do |t|
      t.references :item, foreign_key: true
      t.integer :discount
    end
  end
end
