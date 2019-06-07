class Micropost < ApplicationRecord
  belongs_to :user
  belongs_to :typemicropost
  ratyrate_rateable :title
  default_scope -> {order(created_at: :desc)}
  mount_uploader :picture, PictureUploader
  mount_uploader :attachment, AttachmentUploader
  validates :user_id, presence: true
  validates :content, presence: true, length:{ maximum: 150 }
  validate :fileUpload
  has_many :reviews

  # enum typemicropost_id: {Java: 1, Ruby: 2, Php: 3, Front_end: 4, orther: 5, Ngoai_Ngu: 6 }
  scope :search_type, ->(id){where  typemicropost_id: id if id.present?}
  lamda = lambda do |id_of_user|
    following_ids = "SELECT followed_id  FROM
    relationships WHERE  follower_id = :user_id"
    where "user_id IN (#{following_ids})
    OR user_id = :user_id", user_id: id_of_user
  end
  scope :feed_all, ->(id_of_user){lamda.call(id_of_user)}
  # scope :name
  # has_many :users, through: :reviews


  def fileUpload
    if attachment.size > 300.megabytes
        errors.add(:attachment, "should be less than 300MB")
    end
  end
end
