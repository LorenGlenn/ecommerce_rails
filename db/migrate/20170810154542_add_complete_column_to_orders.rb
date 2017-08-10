class AddCompleteColumnToOrders < ActiveRecord::Migration[5.1]
  def change
    change_table :orders do |t|
      t.boolean :complete, :default => false
    end
  end
end
