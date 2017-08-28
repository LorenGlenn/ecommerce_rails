class AddScoreToProducts < ActiveRecord::Migration[5.1]
  def change
    change_table :products do |t|
      t.integer :score, :default => 0
    end
  end
end
