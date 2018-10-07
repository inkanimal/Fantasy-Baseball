class CreateStadia < ActiveRecord::Migration
  def change
    create_table :stadia do |t|
    t.string :name
    t.integer :team_id
    t.integer :year_opened
    t.string :capacity
    end
  end
end
