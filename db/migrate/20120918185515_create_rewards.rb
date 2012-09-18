class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.integer :program_id
      t.integer :category_id

      t.timestamps
    end
  end
end
