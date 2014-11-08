# Description:
#   ASCII art
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot ascii me <text> - Show text in ascii art
#
# Author:
#   atmos

module.exports = (robot) ->
  robot.respond /ascii(?: me)? (.+)/i, (msg) ->
    msg
      .http("http://asciime.heroku.com/generate_ascii")
      .query(s: msg.match[1].split(' ').join('  '))
      .header('User-Agent', 'Mozilla/5.0')
      .get() (err, res, body) ->
        msg.send body
