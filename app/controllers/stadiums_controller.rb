require 'pry'
class StadiumsController < ApplicationController

  get '/stadiums' do
    @stadiums = Stadium.all
    erb :"stadiums/index"
  end

  get '/stadiums/new' do
    erb :"stadiums/new"
  end

  post '/stadiums' do
    @stadium = Stadium.create(params[:stadium])
    redirect to "/stadiums/#{@stadium.id}"
  end

  get '/stadiums/:id/edit' do
    @stadium = Stadium.find_by_id(params[:id])
    erb :"stadiums/edit"
  end

  patch '/stadiums/:id' do
    @stadium = Stadium.find_by_id(params[:id])
    @stadium.update(params[:stadium])
    @stadium.save
    redirect to "/stadiums/#{@stadium.id}"
  end

  get '/stadiums/:id' do
    @stadium = Stadium.find_by_id(params[:id])
    erb :"stadiums/show"
  end # add controller methods
end
