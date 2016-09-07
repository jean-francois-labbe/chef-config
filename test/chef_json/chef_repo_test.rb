require 'test_helper'

module ChefJson
	class ChefRepoTest < Minitest::Test
		def setup
			@repo_path = File.expand_path('fixtures/chef-repo-fake')
		end

		def test_list_cookbooks
			repo = ChefRepo.new(@repo_path)
			assert_equal 1, repo.cookbooks.size
			assert_equal ["fake-cookbook"], repo.cookbooks
		end
	end
end
