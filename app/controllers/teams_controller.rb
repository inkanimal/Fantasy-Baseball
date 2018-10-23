require 'pry'
class TeamsController < ApplicationController

  get '/teams/home' do
    if logged_in?
      @user = current_user
      @teams = @user.teams
      erb :'teams/home'
    else
      redirect '/users/login'
    end
  end

  get '/teams/new' do
    if logged_in?
      @user = current_user
      erb :'teams/new'
    else
      redirect '/users/login'
    end
  end

  post '/teams' do
    if logged_in?
      @user = current_user
    if params[:name].empty?
       redirect '/teams/new'
    end
       @user = current_user
       new_team = Team.new(name: params[:name], user: current_user)
       if new_team.save
       redirect '/teams/home'
       end
    end
  end

  get '/teams/:id' do
    if logged_in?
       @user = current_user
       @team = current_team
       @players = Player.find_by_id(params[:id])
       erb :'teams/show'
    else
      redirect '/users/login'
    end
  end

  get '/teams/:id/edit' do
    @user = current_user
    @team = current_team
    if logged_in? &&  @user.id == @team.user_id
     erb :'teams/edit'
    else
     redirect '/login'
    end
  end

post '/teams' do
  if logged_in?
    @user = current_user
    @team = Team.create(params[:team])
      @user.id == @team.user_id
    unless params[:player][:name].empty?
    @team.players.create(params[:player])
  end
    unless params[:stadium][:name].empty?
    @teams.stadiums.create(params[:stadium])
  end
    redirect "/teams/#{@team.id}"
  end
end

get '/teams/:id/edit' do
  if logged_in?
    @user = current_user
    @team = Team.find_by_id(params[:id])
    @user.id == @team.user_id
    erb :'teams/edit'
  end
end

patch '/teams/:id' do
  if logged_in?
    @user = current_user
    @team = current_team
   if  @user.id == @team.user_id
     @team.update(params[:team])
   end
  if params[:player] && !params[:player].empty?
    @team.players.create(params[:player])
   end
  if params[:stadium] &&  !params[:stadium].empty?
    @team.players.create(params[:stadium])
  end
   redirect "/teams/#{@team.id}"
  end
end

delete '/teams/:id' do
  if logged_in?
     @team = current_team
     @user = current_user
    if @user.id == @team.user_id
       @team.destroy
       redirect  'teams/home'
    else
      redirect  'teams/home'
    end
  end
 end
end
