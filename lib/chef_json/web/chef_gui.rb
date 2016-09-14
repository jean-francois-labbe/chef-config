require 'sinatra/base'
require 'chef_json'
require 'json'

class Hash
  def compact(opts={})
    inject({}) do |new_hash, (k,v)|
      if !v.empty?
        new_hash[k] = opts[:recurse] && v.class == Hash ? v.compact(opts) : v
      end
      new_hash
    end
  end
end

class ChefJsonWeb < Sinatra::Base

	get '/' do
		r = ChefJson::ChefRepo.new('/home/jeff/Workspace/chef-json-config/gazelle_chef_repo')
		@cookbooks = r.cookbooks
		erb :index
	end

	post '/' do
		puts params.compact({:recurse => true}).compact({:recurse => true}).compact({:recurse => true}).compact({:recurse => true}).compact({:recurse => true}).compact({:recurse => true}).to_json
	end
end

ChefJsonWeb.run!
