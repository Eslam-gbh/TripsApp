class TripSerializer < ApplicationSerializer
  cache key: 'trip'
  attributes :id, :driver, :location, :state
end
