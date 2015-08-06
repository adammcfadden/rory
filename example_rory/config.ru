# define app_root so that it can be used in mapping
app_root = File.dirname(__FILE__)
require File.join(File.dirname(__FILE__), 'config', 'application')

# map assets will tell your app to look for assets in ROOT/assets instead of the public folder
map "/assets" do
  run Rack::File.new(File.join(app_root, "/assets"))
end

# run app by the command `rackup` or if using thin `thin start`
run ExampleApp::Application
