class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :account_id
      t.string :total

      t.timestamps
    end
  end
end
