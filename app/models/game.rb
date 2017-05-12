class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :player1,    class_name: "User", foreign_key: "player1_id"
  belongs_to :player2, class_name: "User", foreign_key: "player2_id"

  def update_rank(game)
    player1 = game.player1
    player2 = game.player2
    p1elo = Elo::Player.new(:rating => player1.rank.score,:games_played => player1.games_played)
    p2elo = Elo::Player.new(:rating => player2.rank.score,:games_played => player2.games_played)
    if game.player1_score>game.player2_score
      game = p1elo.wins_from(p2elo)
    else
      game = p1elo.loses_from(p2elo)
    end
    player1.rank.score = p1elo.rating
    player2.rank.score = p2elo.rating
    player1.rank.save
    player2.rank.save
  end

end
