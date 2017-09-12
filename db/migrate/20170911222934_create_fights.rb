class CreateFights < ActiveRecord::Migration[5.0]
  def change
    create_table :fights do |t|
      t.references :perso, foreign_key: true
      t.boolean :winner
      t.integer :experience

      t.timestamps
    end
  end
end
