require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

   configure do
    enable :sessions
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "password_security"
   end


   get '/' do
      erb :'index'
   end

   get '/signup' do
     if logged_in?
      redirect to '/home'
    else
      erb :'users/signup'
    end
   end

   post "/signup" do
	    if params[:username].empty? || params[:password].empty? || params[:email].empty?
       redirect  '/signup'
     else
	   user = User.new(username: params["username"], email: params["email"], password: params["password"])
       if  user.save
        session[:user_id] = user.id
        redirect '/home'
      end
    end
  end

   get '/login' do
    if logged_in?
      redirect to '/home'
    else
      erb :'users/login'
    end
   end

   post "/login" do
     user = User.find_by(username: params[:username])

     if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/home'
     else
       redirect to '/login'
     end
   end

   get "/logout" do
    if logged_in?
     session.destroy
      redirect to '/'
    else
      redirect to '/'
    end
   end

   get "/teams" do
     if logged_in?
     @user = current_user
     @teams = Team.all
     erb :'teams/home'
   else
     redirect 'users/login'
    end
  end

  get '/teams/new' do
     if !logged_in?
      redirect 'users/login'
     else
     @user = current_user
      erb :"teams/create_team"
    end
   end

   get '/home' do
   if logged_in?
     @user = current_user
     # @players = Player.all
     erb :'teams/home'
   else
     redirect 'users/login'
   end
  end

  post '/home' do
    if logged_in?
     if params[:team_name].empty?
       redirect '/teams/new'
     end
      @user = current_user
      new_team = Team.new(team_name: params[:team_name], user: current_user)
     if new_team.save
       redirect  '/home'
     end
   end
 end

   helpers do
   def logged_in?
     !!session[:user_id]
   end

   def current_user
    User.find_by_id(session[:user_id])
   end
 end



 end
