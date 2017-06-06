Adapter = require('../..').Adapter

class MockAdapter extends Adapter
  send: (envelope, strings...) -> @emit('send', envelope, strings)
  reply: (envelope, strings...) -> @emit('reply', envelope, strings)
  topic: (envelope, strings...) -> @emit('topic', envelope, strings)
  play: (envelope, strings...) -> @emit('play', envelope, strings)

  run: -> self.emit('connected')
  close: -> self.emit('closed')

module.exports.use = (robot) -> return new MockAdapter(robot)
