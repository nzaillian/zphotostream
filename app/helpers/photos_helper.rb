module PhotosHelper
  def next_photo_for(photo)
    @next_photo ||= Photo.visible
                         .where.not(id: photo.id)
                         .where("position < ?", photo.position)
                         .order(position: :desc)
                         .first
  end

  def prev_photo_for(photo)
    @prev_photo ||= Photo.visible
                         .where.not(id: photo.id)
                         .where("position > ?", photo.position)
                         .order(position: :asc)
                         .first
  end
end