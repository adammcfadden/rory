# See inherited methods below
class ApplicationController < Rory::Controller
  # set the layout page, all other pages will be rendered into the <%= yield %> tag on the layout page
  # layout page should be put in the views/layouts folder
  # layout page is set to nil by default and must be set manually
  def layout
    "default"
  end
end

# Rory Controller provides the following methods
    # before_actions
    # after_actions
    # before_action(method_name, opts = {})
    # after_action(method_name, opts = {})
    # ancestor_actions(action_type)
    # initialize(request, routing, app = nil)
    # json_requested?
    # expose(hsh)
    # params
    # route_template
    # layout
    # base_path
    # default_renderer_options
    # extract_options(options_or_template, opts = {})
    # set_response_defaults(opts)
    # render(options_or_template = nil, opts = {})
    # generate_json_from_object(object, opts = {})
    # generate_for_render(opts = {})
    # generate_body_from_template(template_name, opts = {})
    # redirect(path)
    # render_not_found
    # default_content_type(opts = {})
    # present
    # call_filter_for_action?(filter, action)
    # filter_conditions_pass?(filter, type)
    # assess_filter_condition(condition)
    # get_relevant_filters(which_set, action)
    # call_filter_set(which_set, action, opts = {})
    # call_filtered_action(action)
