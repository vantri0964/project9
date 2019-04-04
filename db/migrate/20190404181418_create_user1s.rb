class CreateUser1s < ActiveRecord::Migration[5.2]
  def change
    create_table :user1s do |t|
      t.string :name
      t.string :pass
      t.string :email
      t.datetime :ngayDK
      t.string :point
      t.string :makh
      t.integer :confirm
      t.integer :rale

      t.timestamps
    end
  end
end
