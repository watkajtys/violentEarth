class Quake
	include Mongoid::Document

	field :time, type: Time
	field :latitude, type: Float
	field :longitude, type: Float
	field :magnitude, type: Float
	field :depth, type: Float
	field :region, type: String

end