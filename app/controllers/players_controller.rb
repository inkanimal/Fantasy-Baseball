require 'pry'
class PlayersController < ApplicationController

get '/players/:id' do
  @player = Player.find_by_id(params[:id])
  erb :"players/show"
end # add controller methods
end
