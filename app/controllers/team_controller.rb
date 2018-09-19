require './config/environment'
require 'pry'

class TeamController < ApplicationController



 # get "/bags/:id/edit" do
 #   redirect_if_not_logged_in
 #   @error_message = params[:error]
 #   @bag = GolfBag.find(params[:id])
 #   erb :'golf_bags/edit'
 # end
 #
 # post "/bags/:id" do
 #   redirect_if_not_logged_in
 #   @bag = GolfBag.find(params[:id])
 #   unless GolfBag.valid_params?(params)
 #     redirect "/bags/#{@bag.id}/edit?error=invalid golf bag"
 #   end
 #   @bag.update(params.select{|k|k=="name" || k=="capacity"})
 #   redirect "/bags/#{@bag.id}"
 # end
 #
 # get "/bags/:id" do
 #   redirect_if_not_logged_in
 #   @bag = GolfBag.find(params[:id])
 #   erb :'golf_bags/show'
 # end
 #
 # post "/bags" do
 #   redirect_if_not_logged_in
 #
 #   unless GolfBag.valid_params?(params)
 #     redirect "/bags/new?error=invalid golf bag"
 #   end
 #   GolfBag.create(params)
 #   redirect "/bags"
 # end
end
