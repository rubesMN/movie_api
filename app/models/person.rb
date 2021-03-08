class Person < ApplicationRecord
  attribute :id, :squuid, default: -> { SE::SQUUID.new }
  attribute :personable_id, :squuid

  belongs_to :personable, polymorphic: true
end
