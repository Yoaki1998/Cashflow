class CreateMoves < ActiveRecord::Migration[7.0]
  def change
    create_table :moves do |t|
      t.string :name
      t.string :version
      t.integer :amount
      t.datetime :date, default: DateTime.now
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
