@quake.factory('Quake', ($resource) -> 
	return $resource('/api/v1/quakes/:id', {id: '@id'})
)