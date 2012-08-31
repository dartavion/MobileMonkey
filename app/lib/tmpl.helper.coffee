$ = jQuery

$.fn.item = ->
  item = $(@)
  console.log(item)
  console.log(item.data('item'))
  item = item.data("item") or item.tmplItem?().data
  item?.reload?()

$.fn.forItem = (item) ->
  @filter ->
    compare = $(@).item()
    return item.eql?(compare) or item is compare