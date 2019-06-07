class CreateSugests < ActiveRecord::Migration[5.2]
  def change
    create_table :sugests do |t|
      t.string :mesages
      t.integer :types
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
