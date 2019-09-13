class OfferSerializer < ActiveModel::Serializer
  attributes :id, :tour_name, :about, :departs, :length, :price_from
  belongs_to :providers
end
