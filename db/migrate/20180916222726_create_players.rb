class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
   t.string :player_name
   t.integer :team_id
   t.string :position
   end
  end
end
