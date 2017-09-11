class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def index         # GET /persos
    @persos = Perso.all
  end

  def new           # GET /persos/new
    @perso = Perso.new
  end

  def create        # POST /persos
    @perso = Perso.new(perso_params)
    @perso.save
    redirect_to persos_path
  end

  def destroy       # DELETE /persos/:id
    @perso = Perso.find(params[:id])
    @perso.destroy
  end

  private

  def perso_params
    params.require(:perso).permit(:name, :points_of_life, :attack_points, :picture_url)
  end
end
