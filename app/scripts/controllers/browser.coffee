'use strict'

angular.module('myMusicApp').controller 'BrowserCtrl', ["$rootScope", "$scope", "GPFinder", ($rootScope, $scope, GPFinder) ->
	$scope.title = "CTRL Title !!!!"
	$scope.path = "/"
	$scope.tabs = GPFinder.query path: $scope.path

	$scope.loadDir = (path = $scope.path, isFile)->
		if isFile
			console.log "Loading tab !!!"
			$rootScope.gpFile = "/tabs/?path=#{path}"
		else	
			$scope.path = path
			$scope.tabs = GPFinder.query path: $scope.path

	$scope.parentDir = ()->
		# console.log $scope.path
		$scope.path = $scope.path.replace /\/$/, ""
		$scope.path = $scope.path.substr(0, $scope.path.lastIndexOf("/") + 1)
		
		$scope.loadDir()

	return
]