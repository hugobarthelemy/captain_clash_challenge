class Perso < ApplicationRecord
  has_many :fights

  def nb_fight_win
    Fight.where(perso_id: id, winner: true).count
  end

  def pourcent_fight_win
    if nb_fight_win != 0
      (nb_fight_win / Fight.where(perso_id: id).count)*100
    end
  end
end
