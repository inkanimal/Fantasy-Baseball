require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

   configure do
    enable :sessions
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, "password_security"
   end


   get '/app' do
    # if logged_in?
    #   redirect to '/tweets'
    # else
      html :index
    # end
   end

   get '/signup' do
     if logged_in?
      redirect to '/tweets'
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

        redirect "/tweets"
      end
    end
  end

   get '/login' do
    if logged_in?
      redirect to '/tweets'
    else
      erb :'users/login'
    end
   end



   post "/login" do
     user = User.find_by(username: params[:username])

     if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/tweets'
     else
       redirect to '/login'
     end
   end

   get "/logout" do
    if logged_in?
     session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
   end



 end
