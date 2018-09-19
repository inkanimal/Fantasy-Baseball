require './config/environment'
require 'pry'

class PlayerController < ApplicationController


  get "/players/new" do
    if !logged_in?
     redirect 'users/login'
    else
    @user = current_user
     erb :"players/player_list"
   end
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
