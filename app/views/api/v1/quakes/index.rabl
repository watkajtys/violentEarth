collection :@quakes

node do |s|
  { 
   	:magnitude => s['magnitude'], 
    	:time => s['time'],
    	:depth => s['depth'],
    	:latitude => s['latitude'],
    	:longitude => s['longitude'],
  }
end