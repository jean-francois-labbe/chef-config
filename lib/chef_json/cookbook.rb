module ChefJson
	class Cookbook
		attr_accessor :path

		def initialize path
			@path = path
		end

		def recipes_path
			"#{@path}/recipes"
		end

		def recipes
			begin
				recipes = Dir.entries recipes_path
				recipes = recipes.select{|r| r.include? '.rb' }.map{|r| r.gsub('.rb','')}.sort
			rescue
				recipes = []
			end
			recipes
		end

	end
end
