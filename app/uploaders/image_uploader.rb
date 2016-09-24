# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :xxl do
    process :resize_to_fit => [1200, 1200]
  end

  version :xl do
    process :resize_to_fit => [1024, 1024]
  end

  version :med do
    process :resize_to_fit => [640, 640]
  end

  version :preview do
    process :resize_to_fill => [800, 533]
  end

  version :preview_sm do
    process :resize_to_fill => [580, 386]
  end  

  version :small do
    process :resize_to_fit => [320, 320]
  end

  version :thumbnail do
    process :resize_to_fill => [92, 92]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
