# inherits from Rory Controller
# See Application Controller for list of methods provided by Rory Controller
class ApiController < Rory::Controller
  # create classes to allow for specific rescues of errors
  # inherit from the StandardError ruby class to allow for rescue
  class MissingApiToken < StandardError; end
  class ApiTokenMismatch < StandardError; end

  # note: content_type for api requests is set by default to json by the default_content_type method in the Rory Controller

  private

  def with_authorization
    # call the check_api_token method to validate that there is a token and it is correct
    check_api_token
    # adding a yield tag here will cause the with_authorization method to expect to be treated as a block
    # this will let you call it like so:
      # with_authorization do
      #   some code...
      # end
    yield
    # recuse MissingApiToken if it was raised from check_api_token
  rescue MissingApiToken
    @response = [401, {"Content-type" => "application/json"}, [json_error('Must provide API token')]]
    # recuse ApiTokenMismatch if it was raised from check_api_token
  rescue ApiTokenMismatch
    @response = [403, {"Content-type" => "application/json"}, [json_error('Invalid API token')]]
  end

  def check_api_token
    # raise the MissingApiToken error class if api_token is falsey
    raise MissingApiToken unless api_token
    # set config to the file that holds the api_tokens
    config = YAML.load_file(File.join(Rory.root, 'config', 'api_token.yml'))
    # valid_token selects the corrent token based on what the RORY_STAGE is (test, development, production, etc)
    valid_token = config[ENV['RORY_STAGE']]['token']
    # raise the ApiTokenMismatch error class if api_token is falsey
    raise ApiTokenMismatch unless valid_token == api_token
  end

  def api_token
    #sets and returns the @api_token variable if it has not already been set.
    @api_token ||= @request.env['HTTP_X_API_TOKEN'] || params['HTTP_X_API_TOKEN']
  end

  def json_error(error_message)
    { :message => error_message}.to_json
  end
end
