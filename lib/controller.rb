require 'bundler'
require 'sinatra'
require 'gossip'
require 'csv'
require 'id_potin'

#Bundler.require

class MyApp < Sinatra::Base
 get '/' do 
 erb :index , locals: {gossips: Gossip.all}
 end 

  get '/gossips/new/' do
  erb :new_gossip
  end
  
  post '/gossips/new/' do
  Gossip.new(params["gossip_author"], params["gossip_content"]).save
  redirect '/'
  end
 
  get '/gossips/:id' do
	erb :gossip, locals: {gossips: Gossip.all[params[:id].to_i], id: params[:id].to_i, comments:ID.all_with_id(params[:id].to_i)}
	end

post '/gossips/:id' do
		ID.new(params[:id], params["gossip_comment"]).save
		erb :gossip, locals: {gossips: Gossip.all[params[:id].to_i], id: params[:id].to_i, comments:ID.all_with_id(params[:id].to_i)}
	end	

   get '/gossips/:id/modify' do
   erb :modify, locals: {gossips: Gossip.all[params[:id].to_i], id: params[:id].to_i}
end
  
 end

