@quake.controller "QuakesController", ($scope, Quake, $http) ->

	$scope.timespan = 'hour'

	$scope.loadMagnitudes = -> 
		url = "api/v1/magnitudes.json"
		$http.get(url).success (data) ->
			console.log data
			$scope.magnitudes = data
			$scope.loadTimeSpan($scope.timespan)


	$scope.loadTimeSpan = (timespan) ->
		$scope.timespan = timespan
		$scope.selectedMagnitudes = $scope.magnitudes[timespan]
		keys = Object.keys($scope.selectedMagnitudes)
		console.log 'keys', keys
		values = keys.map (v) ->
  			$scope.selectedMagnitudes[v]
  		console.log values
  		values = values.map (val, i) ->
  			(if val is 0 then null else val)
  		console.log values
  		values.shift()
  		console.log $scope.selectedMagnitudes
		$scope.chartConfig.series[0].data = values
		$scope.chartConfig.loading = false

	$scope.quakes = Quake.query()
	console.log $scope.quakes

	$scope.pieConfig = {}

	$scope.chartConfig = {
            # //Main Highcharts options. Any Highchart options are valid here.
            # //will be ovverriden by values specified below.
            options: {
             	chart: {
                 	type: 'pie',
                 	renderTo: 'container'
               },
               credits: {
               	enabled: false
               },
               xAxis: {
               	minRange: 1,
               	categories: [
                    'Cat0',
                    'cat1',
                    'cat2',
                    'cat3',
                    'cat4',
                    'cat5',
                    'cat6',
                    'cat7',
                    'cat8',
                    'cat9',
                    'cat10'
                	]	               
               },
               plotOptions: {
               	pie: {
               		allowPointSelect: true,
               		cursor: 'pointer'
               		dataLabels: {
               			enabled: false
               		},
               		showInLegend: true
               	}
               }
               yAxis: {
               	title: {text: 'Number of Events'}
               }
            },
            # //Series object - a list of series using normal highcharts series options.
            series: [
            	data: []
            ]
            # //Title configuration
            title: {
               text: 'Earthquakes Magnitudes'
            },

             # //Boolean to control showng loading status on chart
            loading: true,
            # //Configuration for the xAxis. Currently only one x axis can be dynamically controlled.
            # //properties currentMin and currentMax provied 2-way binding to the chart's maximimum and minimum
         }


	$scope.loadMagnitudes()