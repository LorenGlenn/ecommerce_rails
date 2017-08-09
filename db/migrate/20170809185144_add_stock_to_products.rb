class AddStockToProducts < ActiveRecord::Migration[5.1]
  def change
    change_table :products do |t|
      t.integer :stock
    end
  end
end
