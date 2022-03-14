class CreateVisualizations < ActiveRecord::Migration[6.1]
  def change
    create_table :visualizations do |t|
      t.references :photo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
