collection :@recents

node do |s|
  { 
   	:magnitude => s['magnitude'], 
    	:region => s['region'],
    	:time => s['time'],
    	:depth => s['depth'],
    	:latitude => s['latitude'],
    	:longitude => s['longitude'],
  }
end