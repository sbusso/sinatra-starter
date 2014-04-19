require 'bundler'
Bundler.require
require 'sinatra/base'
require 'sinatra/sprockets-helpers'

  class App < Sinatra::Base
    register Sinatra::Sprockets::Helpers

    set :sprockets, Sprockets::Environment.new(root)
    set :assets_prefix, '/assets'
    set :digest_assets, false
    # set :assets_precompile,    [ /\w+\.(?!js|css).+/, /application.(css|js)$/ ]

    configure do
      # Set your Google Analytics ID here if you have one:
      # set :google_analytics_id, 'UA-12345678-1'

      set :layouts_dir, 'views/layouts'
      set :partials_dir, 'views/partials'

      # Setup Sprockets
      %w{javascripts stylesheets images fonts}.each do |type|
        sprockets.append_path File.join(root, 'assets', type)
      end

      # Configure Sprockets::Helpers (if necessary)
      configure_sprockets_helpers
      # sprockets.css_compressor = :scss
      # sprockets.js_compressor  = :uglify

      # Sprockets::Sass.add_sass_funqctions = false

      # config.debug       = true if development?

      set :haml, { :format => :html5 }

    end

    helpers do
      include Sprockets::Helpers
    end

    before do
      expires 500, :public, :must_revalidate
    end

    not_found do
      status 404
    end

    get '/' do
      haml :index, :layout => :'layouts/application'
    end

  end

