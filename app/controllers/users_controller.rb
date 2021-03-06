require 'pry'
class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect to 'teams/home'
    else
      erb :'users/signup'
   end
  end

  post '/signup' do
    #look through usernames, if username exists?

    if params[:username].empty? || params[:password].empty? || params[:email].empty?
      redirect '/signup'
    else
      user = User.new(username: params['username'], password: params['password'], email: params['email'])
      if user.save
        session[:user_id] = user.id
        redirect '/teams/home'
      else
        redirect '/signup'
     end
   end
  end

  get '/login' do
    if logged_in?
      redirect to 'teams/home'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to 'teams/home'
    else
      redirect to '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/'
    else
      redirect to '/'
    end
  end

 end
