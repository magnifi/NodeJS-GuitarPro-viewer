'use strict';

angular.module('myMusicApp').factory 'GPFinder', ["$resource", ($resource) ->
    $resource('/tabs', {class_name: "@class_name",id:"@id"},
	    'get'   : method:'GET'
	    'save'    : method:'POST'
	    'update'  : method:'PUT'
	    'query'   : method:'GET', isArray:true
	    'remove'  : method:'DELETE'
	    'delete'  : method:'DELETE'
    )
]


# .factory 'GPFinder', ($resource) ->
#     $resource "/tabs", {}, {
#     	query: method: 'GET', isArray: true
#     }