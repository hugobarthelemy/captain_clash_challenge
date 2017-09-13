class CreateWeapons < ActiveRecord::Migration[5.0]
  def change
    create_table :weapons do |t|
      t.string :type_of_sort
      t.string :name
      t.references :fight, foreign_key: true
      t.integer :point

      t.timestamps
    end
  end
end
