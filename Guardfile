# A sample Guardfile
# More info at https://github.com/guard/guard#readme
require 'bootstrap-sass'

guard 'sass', :input => 'assets/stylesheets', :output => 'public/assets'


# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'livereload' do
  # App
  watch(%r{app.rb})

  # Asset (Sprocket) files
  watch(%r{public/assets\/.*})

  # Views files
  watch(%r{views/.+\.haml})

  # Public files
  watch(%r{public/.+\.html})
end
