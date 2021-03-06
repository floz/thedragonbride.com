class StageSingleton

	class StageInstance

		mouse: null
		size: null

		_$window: null

		constructor: ->
			@mouse = { x: 0, y: 0 }
			@size = { width: 0, height: 0 }
			@_$window = $( window )

			$( document ).on "mousemove", @_onMouseMove

			@_$window.on "resize", @_onResize
			@_onResize()

		_onMouseMove: ( e ) =>
			@mouse.x = e.clientX
			@mouse.y = e.clientY

		_onResize: ( e ) =>
			@size.width = @_$window.width()
			@size.height = @_$window.height()

	instance = null
	@get: ->
		instance ?= new StageInstance()

stage = StageSingleton.get()
