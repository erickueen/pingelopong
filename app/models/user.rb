class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :validatable
  has_many :games,    class_name: "Games", foreign_key: "player1_id"
  has_many :secondary_games, class_name: "Games", foreign_key: "player2_id"
  has_one :rank

  def games_played
     @games_played ||= Game.where("player1_id = ? OR player2_id = ?", self.id, self.id).count
  end
end
