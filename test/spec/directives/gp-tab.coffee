'use strict'

describe 'Directive: gpTab', () ->

  # load the directive's module
  beforeEach module 'myMusicApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<gp-tab></gp-tab>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the gpTab directive'
