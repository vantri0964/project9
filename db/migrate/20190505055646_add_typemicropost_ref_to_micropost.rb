class AddTypemicropostRefToMicropost < ActiveRecord::Migration[5.2]
  def change
    add_reference :microposts, :typemicropost, foreign_key: true
  end
end
