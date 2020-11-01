class CreateScorecards < ActiveRecord::Migration[5.2]
  def change
    create_table :scorecards do |t|
      t.references :player, foreign_key: true
      t.integer :dice
      t.references :game, foreign_key: true
      t.timestamps
    end
  end
end
