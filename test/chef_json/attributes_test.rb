require 'test_helper'

module ChefJson
  class AttributesTest < Minitest::Test

    def test_it_return_empty_hash_when_no_attributes
      attribute = Attributes.parse("# this is a comment")
      assert attribute.empty?
      assert_equal Array, attribute.class
    end

    def test_it_return_empty_hash_when_attribute_is_commented_out
      attribute = Attributes.parse("# default['postgresql']['version'] = '9.5'")
      assert attribute.empty?
    end

    def test_it_can_parse_attributes_on_one_line
      attribute = Attributes.parse("default['postgresql']['version'] = \"9.5\"")
      refute attribute.empty?
      assert_equal "['postgresql']['version']", attribute[0][:param]
      assert_equal "\"9.5\"", attribute[0][:value]
    end

    def test_it_can_parse_attributes_on_one_line_with_comment_at_the_end
      attribute = Attributes.parse("default['postgresql']['version'] = '9.5' # this is a comment")
      assert_equal "'9.5'", attribute[0][:value]
    end

    def test_it_can_parse_attributes_on_one_line_with_node_param
      attribute = Attributes.parse("default['postgresql']['version'] = node['version']")
      assert_equal "node['version']", attribute[0][:value]
    end

    def test_it_can_parse_attributes_with_hash
      attribute = Attributes.parse("default['postgresql']['version'] = { key: 'value', key2 => 'value2'}")
      assert_equal "{ key: 'value', key2 => 'value2'}", attribute[0][:value]
    end

    def test_it_can_parse_attributes_with_array
skip
      input = <<-END
      default['gazelle_tm']['nagios']['http']['checks']          = [
        node['gazelle_tm']['apache']['apache']['proxy']['path'],
        'gazelle-tm-ejb/GazelleMessageWSService/GazelleMessageWS?wsdl'
      ]
      END
      expected = <<-END
      [
        node['gazelle_tm']['apache']['apache']['proxy']['path'],
        'gazelle-tm-ejb/GazelleMessageWSService/GazelleMessageWS?wsdl'
      ]
      END

      attribute = Attributes.parse(input)
      assert_equal expected, attribute[:value]
    end

    def test_given_an_attributes_file_return_an_array_of_hashes_of_attributes
      input = <<-END
        default['postgresql']['config']['port'] = 5432
        default['postgresql']['config']['log_filename'] = 'postgresql-%a.log'
        default['postgresql']['version'] = "8.3"
        default['postgresql']['enable_pgdg_apt'] = false
      END
      attributes = Attributes.parse(input)
      assert_equal Array, attributes.class
      assert_equal 4, attributes.count
      assert_equal "['postgresql']['config']['port']", attributes.first[:param]
      assert_equal "'postgresql-%a.log'", attributes[1][:value]
    end
  end
end
