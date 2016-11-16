class Idea < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user

  has_many :joins, dependent: :destroy
  has_many :joiners, through: :joins, source: :user

  has_many :comments, dependent: :destroy
  has_many :commenters, through: :comments, source: :user

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def like_for(user)
    self.likes.find_by(user: user)
  end

  def join_for(user)
    self.joins.find_by(user: user)
  end

end
