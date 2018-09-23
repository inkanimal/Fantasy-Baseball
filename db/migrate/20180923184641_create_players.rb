class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
     t.string :name
     t.string :position
     t.string :bats
     t.string :throws
     t.integer :team_id
   end
  end
end
