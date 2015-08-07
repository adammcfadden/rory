require 'json'
require_relative 'api_controller'
# See ApplicationController for methods provided by inheriting ApplicationController
class PostController < ApiController
  # define actions here, these actions will link to your route definitions.
  # def index within the post controller will map to 'post#index'
  def index
    with_authorization do
      # set contractors to equal a json file stored in the fixtures folder
      contractors = File.read(File.join('spec', 'fixtures', 'contractors.json'))
      # set the @response to send json content type and the contractors file
      @response = [200, {'Content-Type' => 'application/json'}, [contractors]]
    end
  end
end
