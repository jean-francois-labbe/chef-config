module ChefJson
	class Attributes

		def self.parse input
			attributes = {}
			input.match /^\s*default(\[.*\])\s*=(\s*[{ :,=>}\w'-.\[\]]*)/
			attributes =  { param: $1.strip , value: $2.strip} unless $1.nil? and $2.nil?
			attributes
		end
	end
end
