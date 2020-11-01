class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.references :game, foreign_key: true
      t.string :title, limit: 1
      t.float :point
      t.timestamps
    end
  end
end
