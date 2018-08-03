class AddMinQuantityToItemPromo < ActiveRecord::Migration[5.2]
  def change
    add_column :item_promos, :min_quantity, :integer
  end
end
