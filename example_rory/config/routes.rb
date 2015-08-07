ExampleApp::Application.set_routes do
  match '/', to: 'post#index', methods: [:get]
  match '/retrieve', to: 'post#retrieve', methods: [:get]
  match '/retrieve_test_json', to: 'post#retrieve_test_json', methods: [:get]
  match '/posts/new', to: 'post#new', methods: [:get]
  match '/posts/create', to: 'post#create', methods: [:post]

  # match initializes an instance of the Route class.
  # this will set the controller and the action for that route
  # ex: match '/posts', to: 'post#index', methods: [:get]
  # controller = post
  # action = index

  # view Route source code at /lib/rory/route.rb

  # Methods Available to the Route class
      # initialize(mask, options = {})
      # name
      # ==(other)
      # regex
      # module
      # methods
      # matches_request?(path, method)
      # path_params(path)
      # to_h

end

# set_routes initializes the RouteMapper class and gives you access to this methods.

# view RouteMapper source code at /lib/rory/route_mapper.rb

# Methods Available to the RouteMapper class
    # set_routes(&block)
    # initialize
    # routing_map
    # scope(options = {}, &block)
    # match(mask, options = {})
