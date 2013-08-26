@quake.factory('Recent', ($resource) -> 
	return $resource('/api/v1/recents/:id', {id: '@id'})
)