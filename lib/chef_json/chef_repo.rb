module ChefJson
	class ChefRepo
		attr_accessor :path

		def initialize path
			@path = path
		end

		def cookbooks
			cookbooks = (Dir.entries cookbooks_path) - ["..", "."]
			cookbooks.map{ |c| Cookbook.new(File.join(cookbooks_path,c))}
		end

		private
		def cookbooks_path
			File.join(@path,'cookbooks')
		end

	end
end
