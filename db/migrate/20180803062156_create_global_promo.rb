class CreateGlobalPromo < ActiveRecord::Migration[5.2]
  def change
    create_table :global_promos do |t|
      t.integer :discount
    end
  end
end
