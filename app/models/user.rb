class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :validatable
  has_many :games,    class_name: "Games", foreign_key: "player1_id"
  has_many :secondary_games, class_name: "Games", foreign_key: "player2_id"
end
