task :ingest => :environment do
	require 'open-uri'
	require 'json'
	url = ('http://earthquake.usgs.gov/earthquakes/feed/v0.1/summary/2.5_month.geojson')
	open url do |f|
		json = f.read
		parsed = JSON.parse(json)
		@ingest = parsed['features']
	end

	@ingest.each do |quake|
		begin
			time   = quake['properties']['time'].to_i/1000
			lat    = quake['geometry']['coordinates'][0].to_f
			long   = quake['geometry']['coordinates'][1].to_f
			mag    = quake['properties']['mag'].to_f
			depth  = quake['geometry']['coordinates'][2].to_f
			region = quake['properties']['place']
			id     = quake['id']
			item = Quake.new(:time => Time.at(time), :latitude => lat, :longitude => long, :magnitude => mag, :depth => depth, :region => region, :identifier => id)
			item.save	
		rescue Exception => e
			puts "#{id} Already in DB #{e}"
			next	
		end	
	end
end