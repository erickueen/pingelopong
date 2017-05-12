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
      if @game.player1.rank == nil
        @game.player1.rank = Rank.new
        @game.player2.rank.save
      end
      if @game.player2.rank. == nil
        @game.player2.rank = Rank.new
        @game.player2.rank.save
      end
      @game.update_rank(@game)
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
