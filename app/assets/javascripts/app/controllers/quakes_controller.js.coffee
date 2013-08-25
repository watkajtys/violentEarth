@quake.controller "QuakesController", ($scope, Quake, $http) ->

	$scope.loadMagnitudes = -> 
		url = "api/v1/magnitudes.json"
		$http.get(url).success (data) ->
			console.log data

			$scope.magnitudes = data


	$scope.quakes = Quake.query()
	console.log $scope.quakes

	$scope.chartConfig = {
            # //Main Highcharts options. Any Highchart options are valid here.
            # //will be ovverriden by values specified below.
            options: {
             	chart: {
                 	type: 'line',
                 	renderTo: 'container'
               },
               credits: {
               	enabled: false
               },
               xAxis: {
               	type: 'datetime',
               	# dateTimeLabelFormats: {
               	# 	hour: '%I %p',
               	# 	minute: '%I%M %p'
               	# },
               },
               yAxis: {
               	title: {text: 'Number of Events'}
               }
            },
            # //Series object - a list of series using normal highcharts series options.
            series: [{
               data: [
               	[Date('2013-08-22T19:38:02Z'), 1.71],
               	[Date('2013-08-22T19:34:38Z'), 1.8],
               	[Date('2013-08-22T19:29:42Z'), 0.9],
               	[Date('2013-08-22T19:14:45Z'), 1.1],
               	[Date('2013-08-22T19:09:07Z'), 0.8],
               	[Date('2013-08-22T18:58:35Z'), 5.1],

               ]
            }],
            # //Title configuration
            title: {
               text: 'Earthquakes Per Hour'
            },
             # //Boolean to control showng loading status on chart
            loading: false,
            # //Configuration for the xAxis. Currently only one x axis can be dynamically controlled.
            # //properties currentMin and currentMax provied 2-way binding to the chart's maximimum and minimum
         }


	$scope.loadMagnitudes()