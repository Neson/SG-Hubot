# Description:
#   None
#
# Dependencies:
#   date-parser moment
#
# Commands:
#   hubot date-test <日期時間> (https://github.com/Neson/date-parser)
#
# Author:
#   Neson

dateParser = require('date-parser')
moment = require('moment-timezone')


module.exports = (robot) ->
  robot.respond /(?:date-test|dt) (.*)/i, (msg) ->
    date = dateParser.parse(msg.match[1])
    if date
      datetime = moment(date).tz("Asia/Taipei").locale('zh-TW').format('LLLL')
      location = (if (date.location) then " @#{date.location}" else '')
      eventName = (if (date.eventName) then "「#{date.eventName}」 " else '')
      endTime = (if (date.endTime) then " ~ #{moment(date.endTime).tz("Asia/Taipei").locale('zh-TW').format('LLLL')}" else '')
      fullDay = (if (date.fullDay) then " (整天)" else '')
      msg.send eventName + datetime + endTime + location + fullDay
    else
      msg.send "阿啊阿啊啊嗚。"
