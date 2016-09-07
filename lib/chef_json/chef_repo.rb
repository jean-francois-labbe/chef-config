module ChefJson
	class ChefRepo
		attr_accessor :path

		def initialize path
			@path = path
		end

		def cookbooks
			cookbooks = Dir.entries cookbooks_path
			cookbooks - ["..", "."]
		end

		private
		def cookbooks_path
			File.join(@path,'cookbooks')
		end

		def read_metadata
			File.open(File.join(@path,'metadata.rb')).read
		end
	end
end
