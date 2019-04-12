class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :pass_word
      t.integer :point
      t.string :code
      t.integer :confirm
      t.integer :role

      t.timestamps
    end
  end
end
