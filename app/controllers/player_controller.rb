require './config/environment'
require 'pry'

class PlayerController < ApplicationController


  get "/players/:id/edit" do
  
   @player = Player.find(params[:id])
   erb :'players/edit'
 end

 post "/players/:id" do
   redirect_if_not_logged_in
   @player = Player.find(params[:id])
   unless GolfClub.valid_params?(params)
     redirect "/clubs/#{@club.id}/edit?error=invalid golf club"
   end
   @player.update(params.select{|k|k=="player_name" || k=="position" || k=="team_id"})
   redirect "/players/#{@player.id}"
 end

 # get "/clubs/:id" do
 #   redirect_if_not_logged_in
 #   @club = GolfClub.find(params[:id])
 #   erb :'golf_clubs/show'
 # end
 #
 # post "/clubs" do
 #   redirect_if_not_logged_in
 #   unless GolfClub.valid_params?(params)
 #     redirect "/clubs/new?error=invalid golf club"
 #   end
 #   GolfClub.create(params)
 #   redirect "/clubs"
 # end
end
