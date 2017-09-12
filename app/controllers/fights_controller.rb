class FightsController < ApplicationController
  def new
    @fight1 = Fight.new(perso_id: :id1)
    @fight2 = Fight.new(perso_id: :id2)
    @persos = [Perso.find(params[:id1]), Perso.find(params[:id2])]
  end

  def create

    @perso1 = Perso.find(params[:id1])
    @perso2 = Perso.find(params[:id2])

    @fight1 = Fight.new(perso_id: @perso1.id)
    @fight2 = Fight.new(perso_id: @perso2.id)

    chance_of_win_perso1 = @perso1.points_of_life + @perso1.attack_points + @perso1.experience
    chance_of_win_perso2 = @perso2.points_of_life + @perso2.attack_points + @perso2.experience

    if chance_of_win_perso1 < chance_of_win_perso2
      @fight2[:winner] = true
      @perso2[:experience] += 1
      @fight1[:winner] = false
    else
      @fight1.winner = true
      @perso1.experience += 1
      @fight2.winner = false
    end
    @perso1.save
    @perso2.save
    @fight1.save!
    @fight2.save!

    # redirect_to fight_path(@perso1)
    redirect_to fight_path(@perso1, params_1: @fight1.id, params_2: @fight2.id)
  end

  def show
    @fight1 = params[:params_1]
    @fight2 = params[:params_2]
  end

end
