require 'json'
require 'pry'
require_relative 'api_controller'
# See ApplicationController for methods provided by inheriting ApplicationController
class PostController < ApiController
  # define actions here, these actions will link to your route definitions.
  # def index within the post controller will map to 'post#index'
  def index
    # by default the post/index.html.erb template will be rendered
  end

  # to send api call
  # `curl -H "X-API-TOKEN:test-token" http://localhost:3000/retrieve`
  def retrieve
    # set posts equal to all posts in database and convert to json
    posts = []
    Post.all.each do |post|
      posts << {:id => post.id, :name => post.name}.to_json
    end
    # set the @response to send the posts variable(which is json Content-Type)
    with_authorization do
      @response = [200, {'Content-Type' => 'application/json'}, [posts]]
    end
  end

  def new
    # by default the post/new.html.erb template will be rendered
  end

  def create
    Post.create(:name => params[:post_name])
    # redirect allows you to send the user to a different path
    redirect '/'
  end

# to send api call
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
