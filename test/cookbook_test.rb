require 'test_helper'

class CookbookTest < Minitest::Test

	def test_it_gather_cookbook_attributes
		attributes = Cookbook.attributes
		assert_equal 2, attributes.size
	end
end
