class AddHiddenToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :hidden, :boolean, default: false
    add_index :photos, :hidden
  end
end
