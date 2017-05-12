class GamesController < ApplicationController


  # GET /games
  def index
    @games = Game.where("player1_id = ? OR player2_id = ?", current_user.id, current_user.id).order('played_at DESC')
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # POST /games
  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to games_path, notice: 'Game was successfully created.'
    else
      render :new
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a trusted parameter "white list" through.
    def game_params
      params.require(:game).permit(:played_at, :player1_score, :player2_score, :player1_id, :player2_id)
    end
end
