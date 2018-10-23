class User < ActiveRecord::Base
    include ActiveModel::Validations
  validates :username, :email, :password_digest, presence: true
  validates :username, uniqueness: true
  has_secure_password

  has_many :teams
  has_many :stadiums, through: :teams
  has_many :players, through: :teams

  # def slug
  #   self.username.downcase.gsub(' ', '-')
  # end
  #
  # def self.find_by_slug(slug)
  #   User.all.find{|user| user.slug == slug}
  # end


end
