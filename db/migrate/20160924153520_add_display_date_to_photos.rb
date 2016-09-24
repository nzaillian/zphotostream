class AddDisplayDateToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :photos, :display_date, :datetime

    reversible do |direction|
      direction.up do
        Photo.find_each do |photo|
          photo.display_date ||= Time.now
          photo.save!
        end
      end
    end
  end
end
