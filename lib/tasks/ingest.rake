task :ingest => :environment do
	require 'open-uri'
	require 'json'
	url = ('http://www.seismi.org/api/eqs/?limit=20')
	open url do |f|
		json = f.read
		parsed = JSON.parse(json)
		@ingest = parsed['earthquakes']
	end

	@ingest.each do |quake|
		time   = quake['timedate'] + ' UTC'
		lat    = quake['lat'].to_f
		long   = quake['lon'].to_f
		mag    = quake['magnitude'].to_f
		depth  = quake['depth'].to_f
		region = quake['region']
		item = Quake.new(:time => Time.parse(time), :latitude => lat, :longitude => long, :magnitude => mag, :depth => depth, :region => region)
		item.save
	end
end