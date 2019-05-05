class Micropost < ApplicationRecord
  belongs_to :user
  belongs_to :typemicropost
  default_scope -> {order(create_at: :desc)}
  mount_uploader :picture, PictureUploader
  mount_uploader :attachment, AttachmentUploader
  validates :user_id, presence: true
  validates :content, presence: true, length:{ maximum: 150 }
  validate :fileUpload

  def fileUpload
    if attachment.size > 300.megabytes
        errors.add(:attachment, "should be less than 300MB")
    end
  end
end
