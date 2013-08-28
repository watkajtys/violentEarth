@quake.controller "QuakesController", ($scope, Quake, Recent, $http) ->

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
		console.log
		$scope.chartConfig.loading = false
		$scope.chartConfig2.loading = false

	$scope.quakes = Quake.query()
	console.log $scope.quakes
	$scope.recents = Recent.query()
	console.log $scope.quakes

	# $scope.tdmChartConfig = {
	# 	options: {
	# 		chart: {
	# 			type: 'area'
	# 			renderTo: 'container'
	# 		},
	# 		credits: {
	# 			enabled: false
	# 		},
	# 		xAxis: {
	# 			type: 'datetime',
	# 		},
	# 		yAxis:[{
	# 			max: 10,
	# 			minTickInterval: 1,
	# 			maxTickInterval: 2,
	# 			labels: {
	# 				style: {
	# 					color: '#89A54E'
	# 				}
	# 			},
	# 			title: {
	# 				text: 'Magnitude',
	# 				style: {
	# 					color: '#89A54E'
	# 				}
	# 			},
	# 		}, {
	# 			labels: {
	# 				style: {
	# 					color: '#89A54E'
	# 				}
	# 			},
	# 			title: {
	# 				text: 'Depth'
	# 			}
	# 			style: {
	# 				color: '#4572A7'
	# 			}
	# 			opposite: true
	# 		}]
	# 		plotOptions: {
 #            series: {
 #               stacking: 'normal',
 #            }
 #         },
	# 	},
	# 	series: [{
	# 		type: 'column',
	# 		name: 'Magnitude',
	# 		data: [1.5, 5.0, 6.8, 3.5]
	# 	}, {
	# 		type: 'column',
	# 		name: 'Depth',
	# 		data: [-119, -40.2, -155.3, -27]
	# 	}],
	# 	loading: false
	# }


	$scope.chartConfig2 = {
		options: {
			colors: ['#2f7ed8', '#0d233a', '#8bbc21', '#910000', '#1aadce', '#492970','#f28f43', '#77a1e5', '#c42525', '#a6c96a'],
			chart: {
				type: 'column',
				renderTo: 'barchart',
				marginTop: 10
			},
			credits: {
				enabled: false
			},
			plotOptions: {
				column: {
					showInLegend: false,
					colorByPoint: true
				}
			},
			xAxis: {
				categories: []
			}
			yAxis: {
            type: 'logarithmic',
            title: {text: 'Number of Events'},
         },
		},
		series: [
			name: 'Number of Quakes',
			data: []
		],
		loading: true
	}


	$scope.chartConfig = {
      # //Main Highcharts options. Any Highchart options are valid here.
      # //will be ovverriden by values specified below.
      colors: ['#2f7ed8', '#0d233a', '#8bbc21', '#910000', '#1aadce', '#492970','#f28f43', '#77a1e5', '#c42525', '#a6c96'],
      options: {
       	chart: {
           	type: 'pie',
           	colors: ['#4E8DB8', '#205C85', '#46DEC8', '#ED6B53', '#B83937', '#64E572', '#FF9655', '#FFF263', '#6AF9C4'],
           	renderTo: 'piechart',
           	marginBottom: 80,
           	marginTop: 0
         },
         credits: {
         	enabled: false
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
      	type: 'pie',
      	name: 'Number of Quakes'
      	data: [
      	]
      ]
      # //Title configuration
      title: {
         text: ''
      },

       # //Boolean to control showng loading status on chart
      loading: true,
      # //Configuration for the xAxis. Currently only one x axis can be dynamically controlled.
      # //properties currentMin and currentMax provied 2-way binding to the chart's maximimum and minimum
   }


	$scope.loadMagnitudes()