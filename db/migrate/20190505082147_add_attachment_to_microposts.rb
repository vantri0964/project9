class AddAttachmentToMicroposts < ActiveRecord::Migration[5.2]
  def change
    add_column :microposts, :attachment, :string
  end
end
