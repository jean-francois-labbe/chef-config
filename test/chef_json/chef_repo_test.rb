require 'test_helper'

module ChefJson
	class ChefRepoTest < Minitest::Test

		def setup
			@chef_repo_path = File.expand_path('fixtures/chef-repo-fake')
		end

		def test_has_cookbooks
			chef_repo = ChefRepo.new(@chef_repo_path)
			assert_equal 2, chef_repo.cookbooks.size
			assert_equal ['fake-cookbook-no-attributes','fake-cookbook'], chef_repo.cookbooks.map{|c| c.name}
		end

	end
end
