# Description:
#   None
#
# Dependencies:
#   date-parser moment
#
# Commands:
#   hubot date <日期時間>
#
# Author:
#   Neson

dateParser = require('date-parser')
moment = require('moment')

module.exports = (robot) ->
  robot.respond /date (.*)/i, (msg) ->
    date = dateParser.parse(msg.match[1])
    if date
      datetime = moment(date).locale('zh-TW').format('LLLL', 'zh-TW')
      location = (if (date.location) then " @#{date.location}" else '')
      eventName = (if (date.eventName) then "「#{date.eventName}」 " else '')
      msg.send eventName + datetime + location
    else
      msg.send "抱歉，我無法理解您的意思。"
