class CreateHotels < ActiveRecord::Migration[5.2]
  def change
    create_table :hotels do |t|
      t.references :player, foreign_key: true
      t.references :step, foreign_key: true

      t.timestamps
    end
  end
end
