class AddImageColumnToUsers < ActiveRecord::Migration[5.0]
  def up
    add_attachment :ideas, :image
  end

  def down
    remove_attachment :ideas, :image
  end
end
