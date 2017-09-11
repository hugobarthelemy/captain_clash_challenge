class CreatePersos < ActiveRecord::Migration[5.0]
  def change
    create_table :persos do |t|
      t.string :name
      t.integer :points_of_life
      t.integer :attack_points
      t.integer :experience
      t.string :picture_url

      t.timestamps
    end
  end
end
