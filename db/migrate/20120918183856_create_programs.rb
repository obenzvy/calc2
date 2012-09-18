class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.integer :card_id
      t.string :name
      t.date :start_period
      t.date :end_period
      t.float :reward_rate
      t.integer :reward_limit

      t.timestamps
    end
  end
end
