class FightsController < ApplicationController
  def new
    @fight1 = Fight.new(perso_id: :id1)
    @fight2 = Fight.new(perso_id: :id2)
    @persos = [Perso.find(params[:id1]), Perso.find(params[:id2])]
    @id1 = params[:id1]
    @id2 = params[:id2]
  end

  def create
    @perso1 = Perso.find(params[:id1])
    @perso2 = Perso.find(params[:id2])

    @fight1 = Fight.new(perso_id: @perso1.id)
    @fight2 = Fight.new(perso_id: @perso2.id)

    if chance_of_win_perso(@perso1, params[:weapon_bouclier_1], params[:weapon_sort_1]) < chance_of_win_perso(@perso2, params[:weapon_bouclier_2], params[:weapon_sort_2])
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
    Weapon.create!(fight_id: Fight.last.id, type_of_sort: "bouclier", point: params[:weapon_bouclier_1][-2].to_i, name: params[:weapon_bouclier_1])
    Weapon.create!(fight_id: Fight.last.id, type_of_sort: "sort", point: params[:weapon_sort_1][-2].to_i, name: params[:weapon_sort_1])
    @fight2.save!
    Weapon.create!(fight_id: Fight.last.id, type_of_sort: "bouclier", point: params[:weapon_bouclier_2][-2].to_i, name: params[:weapon_bouclier_2])
    Weapon.create!(fight_id: Fight.last.id, type_of_sort: "sort", point: params[:weapon_sort_2][-2].to_i, name: params[:weapon_sort_2])

    redirect_to fight_path(@perso1, perso1: @perso1.id, perso2: @perso2.id, params_1: @fight1.id, params_2: @fight2.id)
  end

  def show
    @fight1 = Fight.find(params[:params_1])
    @fight2 = Fight.find(params[:params_2])
    if @fight1.winner == true
      @winner = Perso.find(@fight1.perso_id)
      @fight_of_winner = @fight1
      @looser = Perso.find(@fight2.perso_id)
      @fight_of_looser = @fight2
    else
      @winner = Perso.find(@fight2.perso_id)
      @fight_of_winner = @fight2
      @looser = Perso.find(@fight1.perso_id)
      @fight_of_looser = @fight1
    end

    @persos = [Perso.find(params[:perso1]), Perso.find(params[:perso2])]

  end

  private

  def chance_of_win_perso(perso, bouclier, sort)
    perso.points_of_life + perso.attack_points + perso.experience + how_many_extra_points_for_perso(bouclier, sort)
  end

  def how_many_extra_points_for_perso(bouclier, sort)
    extra_points = 0
    case bouclier
    when "bouclier simple (+1)"
      extra_points += 1
    when "bouclier double (+2)"
      extra_points += 2
    when "super bouclier (+3)"
      extra_points += 3
    end

    case sort
    when "boule de poil (+1)"
      extra_points += 1
    when "herbe à chat (+2)"
      extra_points += 2
    when "Péritonite Infectieuse Féline (+4)"
      extra_points += 4
    end

    return extra_points
  end

end
