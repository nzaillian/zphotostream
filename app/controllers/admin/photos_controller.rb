class Admin::PhotosController < Admin::BaseController
  handles_sortable_columns

  before_action :find_photo, only: member_actions

  def index
  @photos = current_user.photos.order(sortable_column_order || 'position DESC').page(params[:page]).per(50)
  end

  def new
  end

  def create
    @photos = []
    
    params[:image_files].each do |image_file|        
      @photo = current_user.photos.new(
        image: image_file
      )

      if @photo.save
        @photos << @photo
      end
    end

    render json: {
      files: @photos.map { |photo|
        {
          id: photo.id,
          name: photo.image.filename,
          size: photo.image.file.size,
          url: photo.image.url,
          thumbnailUrl: photo.image.url(:thumbnail),
          deleteUrl: admin_photo_path(photo),
          deleteType: 'DELETE'
        }
      }
    }

  end
  
  def show
  end

  def edit
  end

  def update
    if @photo.update(photo_params)
      redirect_to edit_admin_photo_path(@photo), notice: 'Photo settings saved'
    else
      render :edit
    end
  end

  def positions
    if params[:positions].present?
      mappings = []
      # note, unintuitively, each VALUE here is actually a hash of the form {id: "id", position: "position"}
      params[:positions].each_pair do |k, v|
        mappings << {id: v["id"], position: v["position"]}
      end

      for item in mappings
        @photo = current_user.photos.find(item[:id])
        @photo.update!(position: item[:position])
      end
    end

    render json: { status: :success }
  end

  def destroy
    @photo.destroy
    
    respond_to do |format|
      format.json { head :no_content }
      format.html { redirect_to admin_photos_path, notice: 'Photo successfully deleted' }
    end
  end

  private

  def find_photo
    @photo = current_user.photos.friendly.find(params[:id])
  end

  def photo_params
    params.fetch(:photo, {}).permit(:hidden, :title, :caption, :description, :position)
  end
end