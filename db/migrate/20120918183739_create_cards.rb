class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :issuer_id
      t.string :name
      t.string :rewards_type
      t.float :general_rate
      t.integer :threshold_amount
      t.float :threshold_rate

      t.timestamps
    end
  end
end
