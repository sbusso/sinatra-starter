require 'sinatra/asset_pipeline/task.rb'
require './app'

Sinatra::AssetPipeline::Task.define! App

Dir["tasks/*.rake"].sort.each { |ext| load ext }
