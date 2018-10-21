class CreateHabits < ActiveRecord::Migration[5.2]
  def change
    create_table :habits do |t|
      t.string :name
      t.integer :position
      t.text :symbol
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
