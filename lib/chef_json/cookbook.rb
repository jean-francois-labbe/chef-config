module ChefJson
	class Cookbook
		attr_accessor :path

		def initialize path
			@path = path
		end

		def attributes
		attributes_file = File.open(File.join(@path,'attributes/default.rb')).read
Attributes.parse attributes_file
		end

		def name
			metadata = File.open(File.join(@path,'metadata.rb')).read
			metadata.match /name\s*["'](.*)["']$/ 
			$1
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

		private
		def recipes_path
			File.join(@path,'recipes')
		end

	end
end
