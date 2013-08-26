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
		mag = $scope.selectedMagnitudes
		array = []
		for cat of $scope.selectedMagnitudes
  			array.push [cat, mag[cat]]
  		array.shift()
  		for k,v of array
  			v[0] = v[0].replace(/_/, ' ')
  		i = array.length - 1
		while i >= 0
  			array.splice i, 1  if array[i][1] is 0
  			i--
		$scope.chartConfig.series[0].data = array
		$scope.chartConfig2.series[0].data = array
		$scope.chartConfig.loading = false

	$scope.quakes = Quake.query()
	console.log $scope.quakes


	$scope.chartConfig2 = {
		options: {
			chart: {
				type: 'column'
				renderTo: 'container'
			},
			credits: {
				enabled: false
			},
			xAxis: {
				categories: []
			}

		},
		series: [
			data: []
		],
		loading: false
	}


	$scope.chartConfig = {
            # //Main Highcharts options. Any Highchart options are valid here.
            # //will be ovverriden by values specified below.
            options: {
             	chart: {
                 	type: 'pie',
                 	renderTo: 'container'
                 	marginBottom: 80
               },
               credits: {
               	enabled: false
               },
               plotOptions: {
               	pie: {
               		allowPointSelect: true,
               		cursor: 'pointer'
               		dataLabels: {
               			enabled: true
               		},
               		showInLegend: false
               	}
               }
               yAxis: {
               	title: {text: 'Number of Events'}
               }
            },
            # //Series object - a list of series using normal highcharts series options.
            series: [
            	type: 'pie',
            	name: 'Number of Quakes'
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