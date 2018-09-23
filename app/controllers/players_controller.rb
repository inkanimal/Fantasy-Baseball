require 'pry'
class PlayersController < ApplicationController

get '/players' do
   @players = Player.all
   erb :'/players/index'
 end

 get '/players/new' do
    @players = Player.all
   erb :'/players/new'
 end

 post '/players' do
   @player = Player.create(params[:player])
   if !params["team"]["name"].empty?
   @player.team = Team.create(name: params["team"]["name"])
 end
  @player.save
   redirect to "players/#{@player.id}"
 end

  get '/players/:id/edit' do
   @player = Player.find(params[:id])
   erb :'/players/edit'
 end

  get '/players/:id' do
   @player = Player.find(params[:id])
   erb :'/players/show'
 end

 post'/players/:id' do

   @player = Player.find(params[:id])
   @player.update(params["player"])
    if !params["team"]["name"].empty?
     # binding.pry
   @player.team = Team.create(name: params["team"]["name"])
 end
   @player.save
   redirect to "players/#{@player.id}"
 end
end
