class User < ActiveRecord::Base

  belongs_to :team

  def self.valid_params?(params)
    return !params[:player_name].empty? && !params[:position].empty?
  end
  # belongs_to :user

  #  def slug
  #   self.username.downcase.gsub(' ', '-')
  #  end
  #
  #  def self.find_by_slug(slug)
  #  User.all.find{|user| user.slug == slug}
  # end

end
