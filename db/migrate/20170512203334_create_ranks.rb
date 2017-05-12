class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.integer :score, :default => '1000'
      t.references :user, index: true, foreign_key: { to_table: :users }

      t.timestamps null: false
    end
  end
end
