Spine = require('spine')

class Vehicle extends Spine.Model
  @configure 'Vehicle',
  'img', 
  'year', 
  'make', 
  'model', 
  'trim',
  'vin',
  'odometer',
  'color',
  'price',
  'date', 
  'dealershipName',
  'dealershipAddress',
  'dealershipCity',
  'dealershipState',
  'dealershipZip',
  'dealershipPhone',
  'dealershipDistance',
  'messageOneType',
  'messageOneDealership',
  'messageOneMessage',
  'messageOnePrice',
  'messageOneTime',
  'messages'

  @extend Spine.Model.Ajax

  load: ->
    super
    @date = new Date(@messageOneTime)
    # @messageOneTime = convertDate(@messageOneTime)
    @messageOneTypeImage = setMessageTypeImage(@messageOneType)
    @messageTypeText = setMessageTypeText(@messageOneType)
    @thePrettyDate = prettyDate(@messageOneTime)
    
    console.log(prettyDate(@messageOneTime))

  setMessageTypeText = (type) ->
    switch type
      when 'accepted' then return 'Accepted'
      when 'declined' then return 'Declined'
      when 'message' then return 'Message'
      when 'counter' then return 'Counter'
      when 'offer' then return 'Offer'

  setMessageTypeImage = (type) ->
    switch type
      when 'accepted' then return 'message_Accept_Listing sprite'
      when 'declined' then return 'message_Decline_Listing sprite'
      when 'message' then return 'message_Message_Listing sprite'
      when 'counter' then return 'message_Counter_Listing sprite'
      when 'offer' then return 'message_Offer_Listing sprite'


  @dateSort: (a) ->
    if (a.date) > (a.date) then 1 else -1

  convertDate = (date) ->
    month_names = [];
    month_names[month_names.length] = "January";
    month_names[month_names.length] = "February";
    month_names[month_names.length] = "March";
    month_names[month_names.length] = "April";
    month_names[month_names.length] = "May";
    month_names[month_names.length] = "June";
    month_names[month_names.length] = "July";
    month_names[month_names.length] = "August";
    month_names[month_names.length] = "September";
    month_names[month_names.length] = "October";
    month_names[month_names.length] = "November";
    month_names[month_names.length] = "December";

    day_names = [];
    day_names[day_names.length] = "Sunday";
    day_names[day_names.length] = "Monday";
    day_names[day_names.length] = "Tuesday";
    day_names[day_names.length] = "Wednesday";
    day_names[day_names.length] = "Thursday";
    day_names[day_names.length] = "Friday";
    day_names[day_names.length] = "Saturday";

    if date
      date = new Date(date)
      month = month_names[date.getMonth()]
      day = day_names[date.getDay()]
      year = date.getFullYear()
      time = date.getTime()
      hours = padWithZero(date.getHours())
      minutes = padWithZero(date.getMinutes())
      seconds = padWithZero(date.getSeconds())
      
      return day + ', ' + month + ' ' + year + ' ' + hours + ':' + minutes + ':' + seconds 

  padWithZero = (str) ->
    return ('0' + str).slice(-2)

  toJSON: =>
    atts = @.attributes;
    delete atts.id;
    return atts;
  
  prettyDate = (time) ->
    newTime = new Date time 
    # if you need iso time use the next two lines and comment out the third
    # date = new Date((tt || "").replace(/-/g,"/").replace(/[TZ]/g," "))
    # diff = (((new Date()).getTime() - date.getTime()) / 1000)
    diff = (((new Date()).getTime() - newTime.getTime()) / 1000)
    day_diff = Math.floor(diff / 86400)

    if ( isNaN(day_diff) || day_diff < 0 || day_diff >= 31 )
      return
        
    return day_diff == 0 && (
        diff < 60 && "just now" ||
        diff < 120 && "1 minute ago" ||
        diff < 3600 && Math.floor( diff / 60 ) + " minutes ago" ||
        diff < 7200 && "1 hour ago" ||
        diff < 86400 && Math.floor( diff / 3600 ) + " hours ago") ||
      day_diff == 1 && "Yesterday" ||
      day_diff < 7 && day_diff + " days ago" ||
      day_diff < 31 && Math.ceil( day_diff / 7 ) + " weeks ago"


  # @extend @Local
  
  
module.exports = Vehicle