require 'test_helper'

module ChefJson
	class CookbookTest < Minitest::Test
		def setup
			@cookbook_path = File.expand_path('fixtures/fake-cookbook')
		end

		def test_cookbook_has_a_name
			cookbook = Cookbook.new(@cookbook_path)
			assert_equal 'fake-cookbook', cookbook.name
		end

		def test_cookbook_list_attributes
			cookbook = Cookbook.new(@cookbook_path)
			assert_equal 4, cookbook.attributes.size
		end

		def test_cookbook_recipes_returns_an_array
			cookbook = Cookbook.new('')
			assert_equal Array, cookbook.recipes.class
		end

		def test_it_list_recipies_from_a_cookbook_path
			cookbook = Cookbook.new(@cookbook_path)
			expected = ["client", "default", "server", "setup"]
			assert_equal expected, cookbook.recipes
		end

	end
end
