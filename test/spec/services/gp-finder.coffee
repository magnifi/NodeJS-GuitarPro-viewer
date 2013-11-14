'use strict'

describe 'Service: gpFinder', () ->

  # load the service's module
  beforeEach module 'myMusicApp'

  # instantiate service
  gpFinder = {}
  beforeEach inject (_gpFinder_) ->
    gpFinder = _gpFinder_

  it 'should do something', () ->
    expect(!!gpFinder).toBe true
