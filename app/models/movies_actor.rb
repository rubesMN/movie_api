class MoviesActor < ApplicationRecord
  attribute :id, :squuid, default: -> { SE::SQUUID.new }
  attribute :movie_id, :squuid
  attribute :actor_id, :squuid

  belongs_to :movie
  belongs_to :actor
end
