'use strict'

describe 'Controller: BrowserCtrl', () ->

  # load the controller's module
  beforeEach module 'myMusicApp'

  BrowserCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    BrowserCtrl = $controller 'BrowserCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3
