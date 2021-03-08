class Actor < ApplicationRecord
  attribute :id, :squuid, default: -> { SE::SQUUID.new }
  attribute :favorite_movie_id, :squuid

  has_one :person, as: :personable
  #accepts_nested_attributes_for :person # will this work?
  belongs_to :favorite_movie, class_name: "Movie"
  has_many :movies_actors
  has_many :movies, through: :movies_actors

  # delegate :first_name, :last_name, :email, to: person # doesn't work in rails 6.1 for some reason
  def first_name
    person.first_name
  end
  def last_name
    person.last_name
  end
  def email
    person.email
  end

  def bio_link
    "https://en.wikipedia.org/wiki/#{first_name}_#{last_name}"
  end
end
