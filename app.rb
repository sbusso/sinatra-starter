require 'bundler'
Bundler.require
require "sinatra/base"
require "sinatra/reloader"

  class App < Sinatra::Base

    configure :development do
      register Sinatra::Reloader
    end

    set :sprockets, Sprockets::Environment.new(root)
    set :assets_prefix, '/assets'
    set :digest_assets, false
    set :assets_precompile,    [ /\w+\.(?!js|css).+/, /application.(css|js)$/ ]
    # set :public_folder, 'public'

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
      Sprockets::Helpers.configure do |config|
        config.environment = sprockets
        config.prefix      = assets_prefix
        config.digest      = digest_assets
        config.public_path = public_folder

      end

      # sprockets.css_compressor = :scss
      # sprockets.js_compressor  = :uglify

      # Sprockets::Sass.add_sass_functions = false

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


    # Redirect any URLs without a trailing slash to the version with.
    # get %r{(/.*[^\/])$} do
    #   redirect "#{params[:captures].first}/"
    # end


    get '/' do
      # binding.pry
      haml :index, :layout => :'layouts/application'
    end

    # Routes for pages that have unique things...

    # Catch-all for /something/else/etc/ pages which just display templates.
    # get %r{/([\w\/-]+)/$} do |path|
    #   pages = {
    #     'help' => {
    #       :page_name => 'help',
    #       :title => 'Help',
    #     },
    #     'help/accounts' => {
    #       :page_name => 'help_accounts',
    #       :title => 'Accounts Help',
    #     },
    #     # etc
    #   }
    #   if pages.has_key?(path)
    #     @page_name = pages[path][:page_name]
    #     @page_title = pages[path][:title]
    #     layout = :with_sidebar
    #     if pages[path].has_key?(:layout)
    #       layout = pages[path][:layout].to_sym
    #     end
    #     erb @page_name.to_sym,
    #       :layout => layout,
    #       :layout_options => {:views => settings.layouts_dir}
    #   else
    #     show_404
    #   end
    # end

  end

