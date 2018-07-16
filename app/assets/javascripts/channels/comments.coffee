App.comments = App.cable.subscriptions.create "CommentsChannel",
  connected: ->

  disconnected: ->

  received: (data) ->
    $('#comments').append data

  speak: (comment) ->
    @perform 'speak', comment: comment
