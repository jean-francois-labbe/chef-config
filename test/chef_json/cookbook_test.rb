require 'test_helper'

module ChefJson
	class CookbookTest < Minitest::Test

		def test_cookbook_recipes_returns_an_array
			cookbook = Cookbook.new('')
			assert_equal Array, cookbook.recipes.class
		end

		def test_it_list_recipies_from_a_cookbook_path
			cookbook_path = File.expand_path('fixtures/postgresql-develop')
			cookbook = Cookbook.new(cookbook_path)
			expected = ["apt_pgdg_postgresql", "ca_certificates", "client", "config_initdb", "config_pgtune", "contrib", "default", "ruby", "server", "server_conf", "server_debian", "server_redhat", "yum_pgdg_postgresql"]
			assert_equal expected, cookbook.recipes
		end

	end
end
