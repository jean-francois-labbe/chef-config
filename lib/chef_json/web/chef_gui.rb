require 'sinatra/base'
require 'chef_json'

class ChefJsonWeb < Sinatra::Base

	get '/' do
		r = ChefJson::ChefRepo.new()
		@cookbooks = r.cookbooks
		erb :index
	end
end

ChefJsonWeb.run!
