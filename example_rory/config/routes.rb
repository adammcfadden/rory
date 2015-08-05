ExampleApp::Application.set_routes do
  match 'post', to: 'post#index', methods: [:get]

  # match initializes an instance of the Route class.
  # this will set the controller and the action for that route
  # ex: match 'post', to: 'foo#bar', methods: [:get]
  # controller = foo
  # action = bar

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
