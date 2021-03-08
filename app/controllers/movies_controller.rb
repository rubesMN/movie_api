class MoviesController < ApplicationController

  ##
  # @parameter [string] name(query)
  # @parameter [integer] year(query)
  # @parameter [string] fields_json(query or in the body and url encoded)
  #    example: fields_json=[{"membership_definition": ["name",{"tags": ["tag_option_type","tag_value","boss_organization_id","name","tag_value_type","description"]}, "name"]}]
  # @parameter [Boolean] no_links(query)
  # @parameter [Boolean] no_auto_links(query)
  def index
    @movies = []
    if params[:name]
      @movies = Movie.where(name: params[:name])
    elsif params[:year]
      @movies = Movie.where(name: params[:year])
    else
      @movies = Movie.all
    end

    options = {}
    options[:fields] = JSON.parse(params[:fields_json]) if params[:fields_json]
    options[:params] = {
      # current_user: current_user,
      # current_client: current_client,
      some_contextual_controller_accessible_var: "abcd"
    }
    options[:no_links] = params[:no_links] unless params[:no_links].blank?
    options[:no_auto_links] = params[:no_auto_links] unless params[:no_auto_links].blank?
    # render json: {:hello => "world"}
    render json: ::MovieSerializer.new(@movies, options).serializable_hash.as_json

  end
end
