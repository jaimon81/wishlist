class CreateWishes < ActiveRecord::Migration[5.1]
  def change
    create_table :wishes do |t|
      t.integer :user_id
      t.text :wish
      t.timestamps
    end
  end
end
