require 'pry'
class TeamsController < ApplicationController


  # get '/home' do
  #   if logged_in?
  #     @user = current_user
  #     @teams = Team.all
  #     erb :'teams/home'
  #   else
  #     redirect '/users/login'
  #   end
  # end

  get '/teams/new' do
    if logged_in?
      @user = current_user
      erb :'teams/new'
    else
      redirect '/users/login'
    end
  end

  get '/teams/:id' do
    if logged_in?
     @user = current_user
     @teams = Team.find_by_id(params[:id])
     erb :'teams/show'
    else
     redirect '/users/login'
    end
  end

post '/teams' do
  if logged_in?
    @user = current_user
    team = Team.create(params[:team])
    unless params[:player][:name].empty?
    team.players.create(params[:player])
  end
    unless params[:stadium][:name].empty?
    teams.stadiums.create(params[:stadium])
  end
    redirect "/teams/#{team.id}"
  end
end

get '/teams/:id/edit' do
  @team = Team.find_by_id(params[:id])
  erb :'teams/edit'
end

patch '/teams/:id' do
  team = Team.find_by_id(params[:id])
  team.update(params[:team])
  unless params[:player][:name].empty?
    team.players.create(params[:player])
  end
  unless params[:stadium][:name].empty?
    team.players.create(params[:stadium])
  end
  redirect "/teams/#{team.id}"
end
end
