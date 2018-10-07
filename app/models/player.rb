class Player < ActiveRecord::Base
  has_many :team_players
  belongs_to :team
end
