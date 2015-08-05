require 'rory'

#replace ExampleApp with App name

module ExampleApp
  #Application class inherits from the Rory namespace Applicaiton class
  class Application < Rory::Application
  end
end

ExampleApp::Application.root = File.expand_path(File.join('..', '..'), __FILE__)
ExampleApp::Application.require_all_files

#Methods Available to the Rory::Applicaion class
    # inherited(subclass)
    # method_missing(*args, &block)
    # respond_to?(method)
    # instance
    # root=(root_path)
    # auto_require_paths
    # require_all_files
    # root
    # root_path
    # config_path
    # log_path
    # set_routes(&block)
    # routes
    # configure
    # spin_up
    # load_config_data(config_type)
    # connect_db(environment = ENV['RORY_ENV'])
    # use_middleware(*args, &block)
    # middleware
    # dispatcher
    # request_logging_on?
    # turn_off_request_logging!
    # parameters_to_filter
    # filter_parameters(*params)
    # reset_stack
    # use_default_middleware
    # stack
    # call(env)
    # log_file
    # logger
