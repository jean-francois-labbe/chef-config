module ChefJson
	class Attributes

		def self.parse input
			attributes = []
			input.scan(/^\s*default(\[.*\])\s*=([ ]*[\w%-{} "]*)/){ |group1, group2|
				attributes <<  { param: group1.strip , value: group2.strip} unless group1.nil? and group2.nil?
			}
			attributes
		end
	end
end
