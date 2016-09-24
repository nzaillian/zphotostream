class Photo < ApplicationRecord
  include Common::Uuid
  extend FriendlyId
  
  mount_uploader :image, ImageUploader

  friendly_id :uuid

  belongs_to :user

  validates :image, presence: true

  before_create :set_default_position

  scope :visible, ->{ where.not(hidden: true) }
  scope :by_position, ->{ order(position: :desc) }

  private

  def set_default_position
    self.position ||= Photo.count
  end
end