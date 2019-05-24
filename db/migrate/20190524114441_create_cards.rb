class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.references :hand, foreign_key: true
      t.string :name, null: false
      t.string :image, null: false

      t.timestamps
    end
  end
end
