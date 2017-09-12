class AddDefaultExperienceTopersoAndDelateExperienceToFight < ActiveRecord::Migration[5.0]
  def change
    change_column :persos, :experience, :integer, :default => 0
    remove_column :fights, :experience
  end
end
