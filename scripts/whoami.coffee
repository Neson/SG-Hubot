# Description:
#   Turn a URL into a QR Code
#
# Commands:
#   hubot whoami - Shows your name
#   hubot 我是誰 - 說出你的名字

module.exports = (robot) ->

  robot.respond /whoami/i, (msg) ->
    msg.reply "#{msg.message.user.name}"

  robot.respond /我是誰/i, (msg) ->
    msg.reply "#{msg.message.user.name}"
