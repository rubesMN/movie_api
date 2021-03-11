class PersonSerializer
  include JSONAPI::Serializer

  set_system_type :movie_service
  set_type :person

  attributes :first_name, :last_name, :email

end
