class ActorsController < ApplicationController

  ##
  # @parameter [string] fields_json(query or in the body url encoded json)
  # @parameter [Boolean] no_links(query)
  # @parameter [Boolean] no_auto_links(query)
  def index
    @actors = Actor.all
    options = {}
    options[:fields] = JSON.parse(params[:fields_json]) if params[:fields_json]
    options[:params] = {
      # current_user: current_user,
      # current_client: current_client,
      some_contextual_controller_accessible_var: "abcd"
    }
    options[:no_links] = params[:no_links] unless params[:no_links].blank?
    options[:no_auto_links] = params[:no_auto_links] unless params[:no_auto_links].blank?

    render json: ::ActorSerializer.new(@actors, options).serializable_hash
  end
end
