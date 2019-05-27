# frozen_string_literal: true

class CreateHands < ActiveRecord::Migration[5.2]
  def change
    create_table :hands do |t|
      t.references :deck, foreign_key: true

      t.timestamps
    end
  end
end
