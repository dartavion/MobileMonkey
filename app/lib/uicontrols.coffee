Spine = require('spine')
{Panel} = require('spine.mobile')
$ = Spine.$

class UIControls extends Panel
  constructor: ->
    super


  addFooterButton: (text, callback) ->
    callback = @[callback] if typeof callback is 'string'
    button = $('<button />').text(text)
    button.tap(@proxy(callback))
    @footer.append(button)
    button 