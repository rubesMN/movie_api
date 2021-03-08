class MovieSerializer
  include JSONAPI::Serializer

  set_system_type :movie_service
  set_type :movie  # highly recommended
  attributes :name # can be list of attributes comma separated
  attribute :release_year do |object|
    object.year # way to return the attr/obj to serialize from movie object
  end
  #link rel: :self, link_method_name: :url # you can override the auto-generated :self link

  link rel: :imdb_url, system: :imdb, link_method_name: :imdb_url

  has_many :actors  # looks for class ActorsSerializer
  belongs_to :creator, serializer: PersonSerializer
end
