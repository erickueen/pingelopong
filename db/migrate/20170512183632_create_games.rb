class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.date :played_at
      t.integer :player1_score
      t.integer :player2_score
      t.references :player1, index: true, foreign_key: { to_table: :users }
      t.references :player2, index: true, foreign_key: { to_table: :users }

      t.timestamps null: false
    end
  end
end
