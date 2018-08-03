class AddMinPurchaseToGlobalPromo < ActiveRecord::Migration[5.2]
  def change
    add_column :global_promos, :min_purchase, :integer
  end
end
