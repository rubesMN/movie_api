class ActorSerializer < PersonSerializer
  include JSONAPI::Serializer

  set_system_type :movie_service
  set_type :actor # recommended

  attribute :trade_mark

  has_many :movies, key: :played_movies # using key is another way to change the output json key

  belongs_to :favorite_movie, serializer: :movie

  link rel: :bio, system: :IMDB, link_method_name: :bio_link

  link rel: :hair_salon_discount do |obj|
    "www.somesalon.com/#{obj.first_name}"
  end
end
