require './chef_gui'
require 'sass/plugin/rack'

use Sass::Plugin::Rack

run ChefJsonWeb
