module ChefJson
	class ChefRepo
		attr_accessor :path

		def initialize(path='.')
			@path = path
		end

		def cookbooks
			cookbooks = Dir.glob("#{cookbooks_path}/**").select {|f| File.directory? f}
			cookbooks.map{ |c| Cookbook.new(c)}
		end

		private
		def cookbooks_path
			File.join(@path,'cookbooks')
		end

	end
end
