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
    @date = new Date(@date)
    @messageOneTime = convertDate(@messageOneTime)
    @messageOneTypeImage = setMessageTypeImage(@messageOneType)
    @messageTypeText = setMessageTypeText(@messageOneType)

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
  
  # @extend @Local
  
  
module.exports = Vehicle