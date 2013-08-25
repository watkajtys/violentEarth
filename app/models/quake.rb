class Quake
	include Mongoid::Document

	before_validation :categorize

	field :time, type: DateTime
	field :latitude, type: Float
	field :longitude, type: Float
	field :magnitude, type: Float
	field :category, type: Integer 
	field :depth, type: Float
	field :region, type: String
	field :identifier, type: String

	validates :identifier, uniqueness: true

	scope :mag0,  -> {where(:category => 0)}
	scope :mag1,  -> {where(:category => 1)}
	scope :mag2,  -> {where(:category => 2)}
	scope :mag3,  -> {where(:category => 3)}
	scope :mag4,  -> {where(:category => 4)}
	scope :mag5,  -> {where(:category => 5)}
	scope :mag6,  -> {where(:category => 6)}
	scope :mag7,  -> {where(:category => 7)}
	scope :mag8,  -> {where(:category => 8)}
	scope :mag9,  -> {where(:category => 9)}
	scope :mag10, -> {where(:category => 10)}

	scope :hour,  -> {where(time: (1.hour.ago..Time.now))}
	scope :day,   -> {where(time: (24.hours.ago..Time.now))}
	scope :week,  -> {where(time: (7.days.ago..Time.now))}
	scope :month, -> {where(time: (1.month.ago..Time.now))}



	def categorize
		case self.magnitude
		when 0.0..0.9
			self.category = 0
		when 1.0..1.9
			self.category = 1
		when 2.0..2.9
			self.category = 2
		when 3.0..3.9
			self.category = 3
		when 4.0..4.9
			self.category = 4
		when 5.0..5.9
			self.category = 5
		when 6.0..6.9
			self.category = 6
		when 7.0..7.9
			self.category = 7
		when 8.0..8.9
			self.category = 8
		when 9.0..9.9
			self.category = 9
		when 10.0..10.9
			self.category = 10
		end
	end
				
end