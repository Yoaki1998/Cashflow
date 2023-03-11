class CreateProjets < ActiveRecord::Migration[7.0]
  def change
    create_table :projets do |t|
      t.string :name
      t.integer :priority
      t.float :amount
      t.boolean :complete, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
