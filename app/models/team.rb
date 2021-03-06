class Team < ActiveRecord::Base
  has_many :team_players
  has_many :stadiums
  has_many :players, through: :team_players
  belongs_to :user
end
