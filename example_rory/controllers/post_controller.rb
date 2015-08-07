require 'json'
require 'pry'
require_relative 'api_controller'
# See ApplicationController for methods provided by inheriting ApplicationController
class PostController < ApiController
  # define actions here, these actions will link to your route definitions.
  # def index within the post controller will map to 'post#index'
  def index

  end

  # to see api call
  # `curl -H "X-API-TOKEN:test-token" http://localhost:3000/retrieve`
  def retrieve
    posts = []
    Post.all.each do |post|
      posts << {:name => post.name}.to_json
    end
    with_authorization do
      @response = [200, {'Content-Type' => 'application/json'}, [posts]]
    end
  end

  def new
    # # render(options_or_template = nil, opts = {})
    # render(options_or_template = new)
  end

  def create
    Post.create(:name => params[:post_name])
    redirect '/'
  end

# to see api call
# `curl -H "X-API-TOKEN:test-token" http://localhost:3000/retrieve_test_json`
  def retrieve_test_json
    with_authorization do
      # set contractors to equal a json file stored in the fixtures folder
      contractors = File.read(File.join('spec', 'fixtures', 'contractors.json'))
      # set the @response to send json content type and the contractors file
      @response = [200, {'Content-Type' => 'application/json'}, [contractors]]
    end
  end
end
