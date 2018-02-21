class TripSerializer < ActiveModel::Serializer
  cache key: 'trip'
  attributes :id, :driver, :location
end
