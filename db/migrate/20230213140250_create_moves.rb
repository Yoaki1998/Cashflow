class CreateMoves < ActiveRecord::Migration[7.0]
  def change
    create_table :moves do |t|
      t.string :name, null: false
      t.string :version, null: false
      t.integer :amount, default: 0, null: false
      t.datetime :date, default: DateTime.now
      t.integer :taux, default: 0, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
