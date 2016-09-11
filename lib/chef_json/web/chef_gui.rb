require 'sinatra/base'
require 'chef_json'

class ChefJsonWeb < Sinatra::Base
	repo_path = '/home/jeff/Workspace/chef-json-config/gazelle_chef_repo'

	get '/' do
		r = ChefJson::ChefRepo.new(repo_path)
		@cookbooks = r.cookbooks
		erb :index
	end
end

