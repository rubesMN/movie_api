class Movie < ApplicationRecord
  attribute :id, :squuid, default: -> { SE::SQUUID.new }
  attribute :creator_id, :squuid

  belongs_to :creator, class_name: "Person"

  has_many :movies_actors, dependent: :destroy
  has_many :actors, through: :movies_actors

end
