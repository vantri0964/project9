class CreateTypemicroposts < ActiveRecord::Migration[5.2]
  def change
    create_table :typemicroposts do |t|
      t.string :name

      t.timestamps
    end
  end
end
