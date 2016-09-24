class PhotosController < ApplicationController
  before_action :find_photo, only: :show

  def index
    @photos = Photo.visible.by_position.page(params[:page]).per(50)
  end

  def show
  end

  private

  def find_photo
    @photo = Photo.visible.friendly.find(params[:id])
  end
end