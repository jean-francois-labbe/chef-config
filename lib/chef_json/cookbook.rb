module ChefJson
	class Cookbook
		attr_accessor :path

		def initialize path
			@path = path
		end

		def attributes
			begin
				attributes_file = File.open(File.join(@path,'attributes/default.rb')).read
				Attributes.parse attributes_file
			rescue
				[]	
			end

		end

		def name
			read_metadata.match(/name\s*["'](.*)["']$/)
			$1
		end

		def description
			read_metadata.match(/description\s*["'](.*)["']$/)
			$1
		end

		def version
			read_metadata.match(/version\s*["'](.*)["']$/)
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

		def read_metadata
			File.open(File.join(@path,'metadata.rb')).read
		end
	end
end
