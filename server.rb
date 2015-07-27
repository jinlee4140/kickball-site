require "sinatra"
require 'json'

file = File.read('roster.json')
teams = JSON.parse(file)

get "/roster" do
  erb :index, locals: { teams: teams }
end

get "/roster/:team_name" do

  erb :show, locals: {teams: teams, team_name: params[:team_name] }
end	

set :views, File.join(File.dirname(__FILE__), "views")
set :public_folder, File.join(File.dirname(__FILE__), "public")

