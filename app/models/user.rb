class User < ApplicationRecord
  has_secure_password

  before_validation :downcase_email

  has_many :ideas, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_ideas, through: :likes, source: :idea

  has_many :joins, dependent: :destroy
  has_many :joined_ideas, through: :joins, source: :idea

  has_many :comments, dependent: :destroy
  has_many :ceommented_ideas, through: :comments, source: :idea

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: VALID_EMAIL_REGEX

  validates :first_name, presence: true
  validates :last_name, presence: true



  def full_name
    first_name.titleize + " " + last_name.titleize
  end


  private

  def downcase_email
    self.email.downcase! if email.present?
  end

end
