# encoding: UTF-8

require "./app"
require 'uglifier'

use Rack::Deflater
use Rack::Cache, verbose: false
use Rack::ShowExceptions


# map "/assets" do
#   environment = Sprockets::Environment.new
#   environment.append_path "assets/stylesheets"
#   run environment
# end

map App.assets_prefix do
  run App.sprockets
end

map "/" do
  run App
end
