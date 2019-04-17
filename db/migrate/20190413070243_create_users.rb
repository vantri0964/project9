class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :password
      t.integer :point
      t.string :code
      t.integer :confirm
      t.integer :role
      t.string :password_confirmation
      t.timestamps
    end
  end
end
